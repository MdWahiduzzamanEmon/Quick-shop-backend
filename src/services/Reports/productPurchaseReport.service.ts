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
      omit: {
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

//create product stock history
export const createProductStockHistory = async (productStockPurchase: any) => {
  new Promise(async (resolve, reject) => {
    try {
      await db.product_stock_report.create({
        data: {
          product_stock_purchase: { connect: { id: productStockPurchase?.id } },
          product: { connect: { id: productStockPurchase?.productId } },
          vendor: { connect: { id: productStockPurchase?.vendorId } },
          product_stock: productStockPurchase?.product_quantity,
          product_selling_price: productStockPurchase?.product_selling_price,
          product_purchase_price: productStockPurchase?.product_purchase_price,
          product_sold_quantity: 0,
        },
      });

      await db.product.update({
        where: { id: productStockPurchase?.productId },
        data: {
          product_stock: {
            increment: productStockPurchase?.product_quantity,
          },
          product_mrp: productStockPurchase?.product_selling_price,
        },
      });

      resolve("product stock history created");
    } catch (error) {
      reject(error);
    }
  });

  return productStockPurchase;
};
