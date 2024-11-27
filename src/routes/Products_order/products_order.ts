import express from "express";
import type { Request, Response, NextFunction, RequestHandler } from "express";
import { verifyTokenMiddleware } from "../../Others/JWT";
import errorMessage from "../../Others/ErrorMessage/errorMessage";
import { showResponse } from "../../constant/showResponse";
import { product_order_status, Role } from "@prisma/client";
import { getProductInventory } from "../../services/Products/products.service";
import {
  createProductOrder,
  getAllOrderList,
} from "../../services/ProductsOrder/productsOrder.service";
import { generateETag } from "../../Others/OTP/otp";

export const productsOrderRouter = express.Router();

//make order for products

productsOrderRouter.post(
  "/make-order",
  verifyTokenMiddleware,
  createProductsOrderHandler
);

//get all orders

productsOrderRouter.get("/orders", verifyTokenMiddleware, getAllOrdersHandler);

//get single order

productsOrderRouter.get(
  "/orders/:id",
  verifyTokenMiddleware,
  getSingleOrderHandler
);

//delete order

productsOrderRouter.delete(
  "/orders/:id",
  verifyTokenMiddleware,
  deleteOrderHandler
);

//status update

productsOrderRouter.put(
  "/orders/status/:id",
  verifyTokenMiddleware,
  updateOrderStatusHandler
);

//handlers

export type CREATE_PRODUCT_ORDER_TYPE_BODY = {
  productIds: [
    {
      productId: string;
      quantity: number;
      unitPrice: number;
      discount: number;
    }
  ];
  vendorId: string;
  tax: number;
  deliveryCharge: number;
  subtotal: number;
  totalAmount: number;
  orderById: string;
  zoneId: string;
  customerId?: string;
};

async function createProductsOrderHandler(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const reqData = req as any;
  try {
    const { role, id: USER_ID, vendorId } = reqData?.user;
    // console.log("role", reqData?.user);
    //only GENERAL_USER and retailer can make order
    const checkRole = {
      GENERAL_USER: Role.GENERAL_USER,
      RETAILER: Role.RETAILER,
      ADMIN: "ADMIN",
    };
    if (!(role in checkRole)) {
      showResponse(res, {
        status: 403,
        message: "Forbidden! You are not authorized to make order",
      });
      return;
    }
    const {
      productIds,
      quantity,
      unitPrice,
      discount,
      tax,
      deliveryCharge,
      zoneId,
      customerId,
    } = reqData?.body;

    if (role === "ADMIN" && !customerId) {
      showResponse(res, {
        status: 400,
        message: "Bad Request! Required fields are missing",
        requiredFields: ["customerId"],
      });
      return;
    }

    if (!Array.isArray(productIds) || typeof zoneId !== "string") {
      showResponse(res, {
        status: 400,
        message:
          "Bad Request! Invalid data type. ProductIds must be array and zoneId must be string",
        requiredFields: ["productIds", "zoneId"],
      });
      return;
    }

    if (productIds.length > 0) {
      for (let i = 0; i < productIds.length; i++) {
        //quantity, unitPrice, discount must be number and greater than 0

        if (
          typeof productIds[i].quantity !== "number" ||
          productIds[i].quantity <= 0
        ) {
          showResponse(res, {
            status: 400,
            message:
              "Bad Request! Invalid quantity value. Must be greater than 0",
          });
          return;
        }
        if (
          typeof productIds[i].unitPrice !== "number" ||
          productIds[i].unitPrice <= 0
        ) {
          showResponse(res, {
            status: 400,
            message: "Bad Request! Invalid unit price. Must be greater than 0",
          });
          return;
        }
        if (typeof productIds[i].discount !== "number") {
          showResponse(res, {
            status: 400,
            message: "Bad Request! Invalid discount value",
          });
        }

        if (
          !productIds[i].productId ||
          !productIds[i].quantity ||
          !productIds[i].unitPrice
        ) {
          showResponse(res, {
            status: 400,
            message: "Bad Request! Required fields are missing",
            requiredFields: ["productId", "quantity", "unitPrice", "discount"],
          });
          return;
        }
      }
    }

    //if role is customer then get

    const checkProductInventory = await getProductInventory(
      productIds as [
        {
          productId: string;
          quantity: number;
          unitPrice: number;
          discount: number;
        }
      ],
      zoneId
    );
    console.log("checkProductInventory", checkProductInventory);

    if (!checkProductInventory) {
      showResponse(res, {
        status: 404,
        message: "Product not purchased yet",
      });
      return;
    }

    // const productCustomerPrice = Number(
    //   checkProductInventory.productCustomerPrice
    // );
    // const productRetailPrice = Number(checkProductInventory.productRetailPrice);

    // console.log("productCustomerPrice", checkProductInventory);

    // if (role === Role.GENERAL_USER && unitPrice !== productCustomerPrice) {
    //   showResponse(res, {
    //     status: 400,
    //     message: "Bad Request! Invalid unit price for customer",
    //     requiredFields: ["unitPrice"],
    //   });
    //   return;
    // }

    // if (role === Role.RETAILER && unitPrice !== productRetailPrice) {
    //   showResponse(res, {
    //     status: 400,
    //     message: "Bad Request! Invalid unit price for retailer",
    //     requiredFields: ["unitPrice"],
    //   });
    //   return;
    // }

    // if (quantity > checkProductInventory.stockAvailable) {
    //   showResponse(res, {
    //     status: 400,
    //     message: "You can't order more than available stock",
    //     requiredFields: ["quantity"],
    //   });
    //   return;
    // }

    if (tax && typeof tax !== "number" && tax < 0) {
      showResponse(res, {
        status: 400,
        message: "Bad Request! Invalid tax",
        requiredFields: ["tax"],
      });
      return;
    }

    if (
      deliveryCharge &&
      typeof deliveryCharge !== "number" &&
      deliveryCharge < 0
    ) {
      showResponse(res, {
        status: 400,
        message: "Bad Request! Invalid delivery charge",
        requiredFields: ["deliveryCharge"],
      });
      return;
    }

    // const subTotal = Number(unitPrice) * Number(quantity);
    // const discountAmount = (Number(subTotal) * Number(discount)) / 100 || 0;
    // const taxAmount = (Number(subTotal) * Number(tax)) / 100 || 0;
    // const deliveryChargeAmount = Number(deliveryCharge) || 0;
    let subTotal = 0;
    let discountAmount = 0;
    let taxAmount = 0;
    let deliveryChargeAmount = 0;

    for (let i = 0; i < productIds.length; i++) {
      subTotal += productIds[i].unitPrice * productIds[i].quantity;
      discountAmount += (subTotal * productIds[i].discount) / 100 || 0;
      taxAmount += (subTotal * tax) / 100 || 0;
      deliveryChargeAmount += deliveryCharge || 0;
    }

    const amountAfterDiscount = subTotal - discountAmount;
    const amountAfterTax = amountAfterDiscount + taxAmount;
    const totalAmount = amountAfterTax + deliveryChargeAmount;

    const body: CREATE_PRODUCT_ORDER_TYPE_BODY = {
      productIds,
      vendorId,
      quantity,
      unitPrice,
      discount: discountAmount,
      tax: taxAmount,
      deliveryCharge: deliveryChargeAmount,
      subtotal: subTotal,
      totalAmount,
      orderById: USER_ID,
      ...(customerId && { customerId }),
      zoneId,
    };

    const order = await createProductOrder(body);
    if (!order) {
      showResponse(res, {
        status: 400,
        message: "Failed to make order",
      });
      return;
    }

    showResponse(res, {
      status: 201,
      message: "Order made successfully",
    });
  } catch (error) {
    errorMessage(res, error, next);
  }
}

async function getAllOrdersHandler(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const reqData = req as any;
  try {
    const { role: TOKEN_ROLE, vendorId } = reqData?.user;
    //only GENERAL_USER and retailer can make order
    if (TOKEN_ROLE !== "ADMIN") {
      showResponse(res, {
        status: 403,
        message: "Forbidden! You are not authorized to get orders",
      });
      return;
    }

    const {
      pageNumber,
      rowPerPage,
      pagination,
      status,
      orderById,
      zoneId,
      productId,
      date_range,
      date,
    } = reqData.query as any;

    if (status && !(status in product_order_status)) {
      showResponse(res, {
        status: 400,
        message: "Bad Request! Invalid status",
        requiredFields: ["status"],
      });
      return;
    }

    const productOrders = await getAllOrderList(
      pageNumber,
      rowPerPage,
      pagination,
      vendorId,
      status,
      orderById,
      zoneId,
      productId,
      date_range,
      date
    );

    // Cache for 24 hr, but verify every on each request with no-cache
    res.setHeader("Cache-Control", `max-age=${60 * 60 * 24}, no-cache`);

    // Generate ETag based on new data and set it in the response
    // Generate ETag based on new data and set it in the response
    const etag = generateETag(productOrders);
    res.setHeader("ETag", `"${etag}"`);

    const ifNoneMatchValue = req.headers["if-none-match"];

    // Check if the client has the latest data
    if (ifNoneMatchValue === `"${etag}"`) {
      // 304 Not Modified
      res.status(304).end();
      return;
    }

    showResponse(res, {
      status: 200,
      message: "Orders fetched successfully",
      data: productOrders,
    });
  } catch (error) {
    errorMessage(res, error, next);
  }
}

async function getSingleOrderHandler(
  req: Request,
  res: Response,
  next: NextFunction
) {}

async function deleteOrderHandler(
  req: Request,
  res: Response,
  next: NextFunction
) {}

async function updateOrderStatusHandler(
  req: Request,
  res: Response,
  next: NextFunction
) {}
