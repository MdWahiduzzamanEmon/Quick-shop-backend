import { convertIsoDate } from "../../Others/DateConvertIso";
import { generateUniqueID } from "../../Others/OTP/otp";
import { paginationCustomResult } from "../../Others/paginationCustomResult";
import { CREATE_PRODUCT_STOCK_PURCHASE_TYPE } from "../../routes/product_stock_purchase/product_stock_purchase";
import { db } from "../../utils/db.server";
import { createProductStockHistory } from "../Reports/productPurchaseReport.service";

export const getAllProductStockPurchase = async (
  pageNumber: number,
  rowPerPage: number,
  pagination: boolean,
  vendorId: string,
  purchaseUniqueId: string
) => {
  //pagination
  const pageNumbers = pageNumber ? parseInt(pageNumber.toString()) : 1;
  const resultPerPage = rowPerPage ? parseInt(rowPerPage.toString()) : 10;
  const [result, total] = await Promise.all([
    db.product_stock_purchase.findMany({
      where: {
        ...(vendorId && { vendorId }),
        ...(purchaseUniqueId && { purchaseUniqueId }),
      },
      orderBy: {
        createdAt: "desc",
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
        createdBy: {
          select: {
            username: true,
            email: true,
            mobile: true,
          },
        },
        zone: {
          select: {
            zone_name: true,
            contact_no: true,
            operator: {
              select: {
                id: true,
                fullName: true,
                employeeID: true,
                address: true,
                whatsapp: true,
              },
            },
          },
        },
        supplier: {
          select: {
            supplierName: true,
            supplierUniqueId: true,
            srName: true,
            srContactNo: true,
            dealerName: true,
            dealerContactNo: true,
          },
        },
      },
    }),
    pagination
      ? db.product_stock_purchase.count({
          where: {
            ...(vendorId && { vendorId }),
            ...(purchaseUniqueId && { purchaseUniqueId }),
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

//create product stock purchase

export const createProductStockPurchase = async ({
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
  vendorId,
  createdById,
}: CREATE_PRODUCT_STOCK_PURCHASE_TYPE) => {
  const productStockPurchase = await db.product_stock_purchase.create({
    data: {
      ...(purchase_date && { purchase_date: convertIsoDate(purchase_date) }),
      supplierId,
      productId,
      product_quantity: parseInt(product_quantity.toString()),
      product_selling_price: parseFloat(product_selling_price.toString()),
      product_purchase_price: parseFloat(product_purchase_price.toString()),
      product_retail_price: parseFloat(product_retail_price.toString()),
      product_old_mrp: parseFloat(product_old_mrp.toString()),
      special_offer: special_offer || "",
      zoneId,
      vendorId,
      createdById,
      purchaseUniqueId: generateUniqueID("PSP"),
    },
  });

  //update product stock
  if (productStockPurchase?.productId) {
    await db.product.update({
      where: { id: productStockPurchase?.productId },
      data: {
        product_stock: {
          increment: productStockPurchase?.product_quantity,
        },
        product_c_mrp: productStockPurchase?.product_selling_price,
        product_r_mrp: productStockPurchase?.product_retail_price,
      },
    });
  }

  // Start creating the product stock history without awaiting it
  (async () => {
    try {
      await createProductStockHistory(productStockPurchase);
      console.log("Product stock history created successfully");
    } catch (error) {
      console.error("Failed to create product stock history", error);
    }
  })();

  return productStockPurchase;
};
