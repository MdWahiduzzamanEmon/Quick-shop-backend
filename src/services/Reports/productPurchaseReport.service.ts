import { paginationCustomResult } from "../../Others/paginationCustomResult";
import { db } from "../../utils/db.server";

export const getAllProductStockPurchaseReport = async (
  pageNumber?: number,
  rowPerPage?: number,
  pagination?: boolean,
  vendorId?: string
) => {
  //pagination
  const pageNumbers = pageNumber ? parseInt(pageNumber.toString()) : 1;
  const resultPerPage = rowPerPage ? parseInt(rowPerPage.toString()) : 10;

  const [result, total] = await Promise.all([
    db.product_stock_report.findMany({
      where: {
        ...(vendorId && { vendorId }),
      },
      ...(pagination && {
        skip: (pageNumbers - 1) * resultPerPage,
        take: resultPerPage,
      }),

      include: {
        product: {
          select: {
            id: true,
            product_name: true,
            product_code: true,
          },
        },
        product_stock_purchase: {
          select: {
            id: true,
            purchaseUniqueId: true,
          },
        },
      },
      omit:{
        product_stock_purchaseId: true,
      },

      orderBy: {
        createdAt: "desc",
      },
    }),
    pagination
      ? db.product_stock_report.count({
          where: {
            ...(vendorId && { vendorId }),
          },
        })
      : Promise.resolve(0),
  ]);

  if (!pagination) return result;

  const res = paginationCustomResult({
    pageNumbers,
    resultPerPage,
    result,
    totalResultCount: total,
  });

  return res;
};
