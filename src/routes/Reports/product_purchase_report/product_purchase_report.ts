import express from "express";
import type { Request, Response, NextFunction, RequestHandler } from "express";

import errorMessage from "../../../Others/ErrorMessage/errorMessage";
import { showResponse } from "../../../constant/showResponse";

import { getAllProductStockPurchaseReport } from "../../../services/Reports/productPurchaseReport.service";
import { verifyTokenMiddleware } from "../../../Others/JWT";

export const productPurchaseReportRouter = express.Router();

productPurchaseReportRouter.get(
  "/product-stock-report",
  verifyTokenMiddleware,
  getProductPurchaseReportHandler
);

//get product purchase report
async function getProductPurchaseReportHandler(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const reqData = req as any;
  try {
    const { user, vendorId } = reqData;
    if (user?.role !== "ADMIN" && user?.role !== "OPERATOR") {
      showResponse(res, {
        status: 403,
        message: "Forbidden. Only Admin can access this route",
      });
      return;
    }

    const { pageNumber, rowPerPage, pagination, purchaseUniqueId } =
      reqData.query as any;

    const stockReport = await getAllProductStockPurchaseReport(
      pageNumber,
      rowPerPage,
      pagination,
      vendorId
    );
    showResponse(res, {
      status: 200,
      message: "Product Purchase Report",
      data: stockReport,
    });
  } catch (error) {
    errorMessage(res, error, next);
  }
}
