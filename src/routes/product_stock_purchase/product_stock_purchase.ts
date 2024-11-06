import express from "express";
import type { Request, Response, NextFunction, RequestHandler } from "express";
import { verifyTokenMiddleware } from "../../Others/JWT";
import errorMessage from "../../Others/ErrorMessage/errorMessage";
import { showResponse } from "../../constant/showResponse";
import {
  createProductStockPurchase,
  getAllProductStockPurchase,
} from "../../services/Product_stock_purchase/Product_stock_purchase.service";
import { generateETag } from "../../Others/OTP/otp";

export const productStockPurchaseRouter = express.Router();

productStockPurchaseRouter.post(
  "/product-purchase",
  verifyTokenMiddleware,
  createProductStockPurchaseHandler
);

productStockPurchaseRouter.get(
  "/product-purchase",
  verifyTokenMiddleware,
  getProductStockPurchaseHandler
);

productStockPurchaseRouter.get(
  "/product-purchase/:id",
  verifyTokenMiddleware,
  getSingleProductStockPurchaseHandler
);

productStockPurchaseRouter.put(
  "/product-purchase/:id",
  verifyTokenMiddleware,
  updateProductStockPurchaseHandler
);

productStockPurchaseRouter.delete(
  "/product-purchase/:id",
  verifyTokenMiddleware,
  deleteProductStockPurchaseHandler
);

//get product stock purchase

async function getProductStockPurchaseHandler(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const reqData = req as any;
  try {
    const { vendorId, role: TOKEN_ROLE } = reqData?.user;

    if (TOKEN_ROLE !== "ADMIN" && TOKEN_ROLE !== "OPERATOR") {
      showResponse(res, {
        status: 403,
        message: "Forbidden! You are not authorized to perform this action",
      });
      return;
    }
    const { pageNumber, rowPerPage, pagination, purchaseUniqueId } =
      reqData.query as any;

    const products = await getAllProductStockPurchase(
      pageNumber,
      rowPerPage,
      pagination,
      vendorId,
      purchaseUniqueId
    );

    // Cache for 24 hr, but verify every on each request with no-cache
    res.setHeader("Cache-Control", `max-age=${60 * 60 * 24}, no-cache`);

    // Generate ETag based on new data and set it in the response
    // Generate ETag based on new data and set it in the response
    const etag = generateETag(products);
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
      message: "Product stock purchase fetched successfully",
      data: products,
    });
  } catch (error: any) {
    errorMessage(res, error, next);
  }
}

//create product stock purchase

export type CREATE_PRODUCT_STOCK_PURCHASE_TYPE = {
  purchase_date?: string;
  supplierId: string;
  productId: string;
  product_quantity: number;
  product_selling_price: number;
  product_purchase_price: number;
  product_retail_price: number;
  product_old_mrp: number;
  special_offer: string;
  zoneId: string;
  vendorId: string;
  createdById: string;
};

async function createProductStockPurchaseHandler(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const reqData = req as any;
  try {
    const { vendorId, role: TOKEN_ROLE, id: createdById } = reqData?.user;

    if (TOKEN_ROLE !== "ADMIN" && TOKEN_ROLE !== "OPERATOR") {
      showResponse(res, {
        status: 403,
        message: "Forbidden! You are not authorized to perform this action",
      });
      return;
    }
    const {
      purchase_date,
      supplierId,
      productId,
      product_quantity,
      product_selling_price,
      product_purchase_price,
      product_retail_price,
      product_old_mrp,
      special_offer,
      zoneId,
    } = reqData.body as any;

    if (
      !supplierId ||
      !productId ||
      !product_quantity ||
      !product_selling_price ||
      !product_purchase_price ||
      !product_retail_price ||
      !product_old_mrp ||
      !zoneId
    ) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Please provide all required fields",
      });
      return;
    }

    if (product_quantity <= 0) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Product quantity should be greater than 0",
      });
      return;
    }

    if (product_selling_price <= 0) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Product selling price should be greater than 0",
      });
      return;
    }

    if (product_purchase_price <= 0) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Product purchase price should be greater than 0",
      });
      return;
    }

    if (product_retail_price <= 0) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Product retail price should be greater than 0",
      });
      return;
    }

    if (product_old_mrp <= 0) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Product old MRP should be greater than 0",
      });
      return;
    }

    const data: CREATE_PRODUCT_STOCK_PURCHASE_TYPE = {
      ...(purchase_date && { purchase_date }),
      supplierId,
      productId,
      product_quantity,
      product_selling_price,
      product_purchase_price,
      product_retail_price,
      product_old_mrp,
      special_offer,
      zoneId,
      vendorId,
      createdById,
    };

    await createProductStockPurchase(data);
    showResponse(res, {
      status: 201,
      message: "Product stock purchase created successfully",
    });
  } catch (error: any) {
    errorMessage(res, error, next);
  }
}

//get single product stock purchase

async function getSingleProductStockPurchaseHandler(
  req: Request,
  res: Response,
  next: NextFunction
) {}

//update product stock purchase

async function updateProductStockPurchaseHandler(
  req: Request,
  res: Response,
  next: NextFunction
) {}

//delete product stock purchase

async function deleteProductStockPurchaseHandler(
  req: Request,
  res: Response,
  next: NextFunction
) {}
