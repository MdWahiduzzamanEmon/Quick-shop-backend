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
        zone: {
          select: {
            zone_name: true,
            operator: {
              select: {
                employeeID: true,
                fullName: true,
                whatsapp: true,
              },
            },
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
export const createProductStockHistory = async (
  productStockPurchase: any,
  zoneId: string
) => {
  new Promise(async (resolve, reject) => {
    try {
      await db.product_stock_report.create({
        data: {
          product_stock_purchase: { connect: { id: productStockPurchase?.id } },
          product: { connect: { id: productStockPurchase?.productId } },
          vendor: { connect: { id: productStockPurchase?.vendorId } },
          product_stock: productStockPurchase?.product_quantity,
          product_selling_price: productStockPurchase?.product_selling_price,
          product_retail_price: productStockPurchase?.product_retail_price,
          product_purchase_price: productStockPurchase?.product_purchase_price,
          product_sold_quantity: 0,
          zone: { connect: { id: zoneId } },
        },
      });

      resolve("product stock history created");
    } catch (error) {
      reject(error);
    }
  });

  return productStockPurchase;
};

export const getAllProductStockPurchaseReportByProductId = async (
  productId: string,
  zoneId: string
) => {
  const stockReport = await db.product_stock_report.findMany({
    where: {
      productId: productId,
      zoneId,
    },
    orderBy: {
      createdAt: "asc",
    },
  });

  return stockReport;
};

// Function to process order for a product
export const processOrderForProduct = async (
  productId: string,
  zoneId: string,
  orderQuantity: number
) => {
  // Step 1: Retrieve stock report sorted by createdAt
  const stockReport = await getAllProductStockPurchaseReportByProductId(
    productId,
    zoneId
  );

  let remainingQuantity = orderQuantity; // Track remaining order quantity to be deducted
  let cumulativeSoldQuantity = 0; // Track cumulative sold quantity for all processed rows

  // Step 2: Iterate through the stock report and deduct quantities
  for (const stockEntry of stockReport) {
    if (remainingQuantity <= 0) break; // Stop once the full order is processed

    if (stockEntry.product_stock > 0) {
      // Determine how much to deduct from the current stock
      const deductQuantity = Math.min(
        stockEntry.product_stock,
        remainingQuantity
      );

      // Step 3: Update the cumulative sold quantity
      cumulativeSoldQuantity += deductQuantity;

      // Step 4: Update stock and cumulative sold quantity for this entry
      const newStock = stockEntry.product_stock - deductQuantity;
      const newSoldQuantity = cumulativeSoldQuantity; // Update sold quantity to the cumulative amount

      // Update the stock and sold quantity in the database
      await db.product_stock_report.update({
        where: { id: stockEntry.id },
        data: {
          product_stock: newStock, // Updated stock after deduction
          product_sold_quantity: newSoldQuantity, // Reflect cumulative sold amount
        },
      });

      // Step 5: Decrease the remaining quantity of the order
      remainingQuantity -= deductQuantity;
    }
  }

  // Step 6: Handle if there's not enough stock to fulfill the order
  if (remainingQuantity > 0) {
    return {
      success: false,
      message: `Not enough stock to fulfill the order. Remaining quantity: ${remainingQuantity}`,
    };
  }

  return {
    success: true,
    message: "Order processed successfully",
  };
};
