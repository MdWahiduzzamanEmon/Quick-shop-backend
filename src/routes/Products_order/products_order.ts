import express from "express";
import type { Request, Response, NextFunction, RequestHandler } from "express";
import { verifyTokenMiddleware } from "../../Others/JWT";
import errorMessage from "../../Others/ErrorMessage/errorMessage";
import { showResponse } from "../../constant/showResponse";
import { Role } from "@prisma/client";
import { getProductInventory } from "../../services/Products/products.service";
import { createProductOrder } from "../../services/ProductsOrder/productsOrder.service";

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
  productId: string;
  vendorId: string;
  quantity: number;
  unitPrice: number;
  discount: number;
  tax: number;
  deliveryCharge: number;
  subtotal: number;
  totalAmount: number;
  otherUsersId: string;
  zoneId: string;
};

async function createProductsOrderHandler(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const reqData = req as any;
  try {
    const { role, customerId: USER_ID, vendorId } = reqData?.user;
    // console.log("role", reqData?.user);
    //only GENERAL_USER and retailer can make order
    if (!(role in Role)) {
      showResponse(res, {
        status: 403,
        message: "Forbidden! You are not authorized to make order",
      });
      return;
    }
    const {
      productId,
      quantity,
      unitPrice,
      discount,
      tax,
      deliveryCharge,
      zoneId,
    } = reqData?.body;

    if (!productId || !quantity || !unitPrice || !zoneId) {
      showResponse(res, {
        status: 400,
        message: "Bad Request! Required fields are missing",
        requiredFields: ["productId", "quantity", "unitPrice", "zoneId"],
      });
      return;
    }

    if (typeof productId !== "string" || typeof zoneId !== "string") {
      showResponse(res, {
        status: 400,
        message: "Bad Request! Invalid data type. Data type must be string",
        requiredFields: ["productId", "zoneId"],
      });
      return;
    }

    //if role is customer then get
    const checkProductInventory = await getProductInventory(productId, zoneId);

    if (!checkProductInventory) {
      showResponse(res, {
        status: 404,
        message: "Product not purchased yet",
      });
      return;
    }

    if (checkProductInventory.stockAvailable === 0) {
      showResponse(res, {
        status: 400,
        message: "Product is out of stock",
      });
      return;
    }

    const productCustomerPrice = Number(
      checkProductInventory.productCustomerPrice
    );
    const productRetailPrice = Number(checkProductInventory.productRetailPrice);

    // console.log("productCustomerPrice", checkProductInventory);

    if (role === Role.GENERAL_USER && unitPrice !== productCustomerPrice) {
      showResponse(res, {
        status: 400,
        message: "Bad Request! Invalid unit price for customer",
        requiredFields: ["unitPrice"],
      });
      return;
    }

    if (role === Role.RETAILER && unitPrice !== productRetailPrice) {
      showResponse(res, {
        status: 400,
        message: "Bad Request! Invalid unit price for retailer",
        requiredFields: ["unitPrice"],
      });
      return;
    }

    if (quantity > checkProductInventory.stockAvailable) {
      showResponse(res, {
        status: 400,
        message: "You can't order more than available stock",
        requiredFields: ["quantity"],
      });
      return;
    }

    if (discount && typeof discount !== "number" && discount < 0) {
      showResponse(res, {
        status: 400,
        message: "Bad Request! Invalid discount",
        requiredFields: ["discount"],
      });
      return;
    }

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

    const subTotal = Number(unitPrice) * Number(quantity);
    const discountAmount = (Number(subTotal) * Number(discount)) / 100 || 0;
    const taxAmount = (Number(subTotal) * Number(tax)) / 100 || 0;
    const deliveryChargeAmount = Number(deliveryCharge) || 0;

    const amountAfterDiscount = subTotal - discountAmount;
    const amountAfterTax = amountAfterDiscount + taxAmount;
    const totalAmount = amountAfterTax + deliveryChargeAmount;

    const body: CREATE_PRODUCT_ORDER_TYPE_BODY = {
      productId,
      vendorId,
      quantity,
      unitPrice,
      discount: discountAmount,
      tax: taxAmount,
      deliveryCharge: deliveryChargeAmount,
      subtotal: subTotal,
      totalAmount,
      otherUsersId: USER_ID,
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
) {}

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