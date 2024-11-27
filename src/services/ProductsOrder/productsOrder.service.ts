import { product_order_status } from "@prisma/client";
import { paginationCustomResult } from "../../Others/paginationCustomResult";
import { CREATE_PRODUCT_ORDER_TYPE_BODY } from "../../routes/Products_order/products_order";
import { db } from "../../utils/db.server";
import { processOrderForProduct } from "../Reports/productPurchaseReport.service";
import {
  DateFilterOptions,
  getDateRangeForFilter,
} from "../../constant/getDateRangeForFilter";

//getAllOrderList
// Modify getAllOrderList to use getDateRangeForFilter
export const getAllOrderList = async (
  pageNumber: number,
  rowPerPage: number,
  pagination: boolean,
  vendorId: string,
  status: product_order_status,
  orderById: string,
  zoneId: string,
  productId: string,
  date_range: string,
  date: DateFilterOptions
) => {
  const pageNumbers = pageNumber ? parseInt(pageNumber.toString()) : 1;
  const resultPerPage = rowPerPage ? parseInt(rowPerPage.toString()) : 10;

  let dateForFilter = getDateRangeForFilter(date, date_range);

  const [result, total] = await Promise.all([
    db.product_order.findMany({
      where: {
        ...(vendorId && { vendorId }),
        ...(status && { orderStatus: status }),
        ...(orderById && { orderBy: { id: orderById } }),
        ...(zoneId && { zoneId }),
        ...(productId && { productId }),
        ...(dateForFilter && {
          orderDate: {
            gte: dateForFilter.startDate,
            lte: dateForFilter.endDate,
          },
        }),
      },
      orderBy: {
        createdAt: "desc",
      },
      ...(pagination && {
        skip: (pageNumbers - 1) * resultPerPage,
        take: resultPerPage,
      }),
      select: {
        id: true,
        vendorId: true,
        quantity: true,
        unitPrice: true,
        discount: true,
        tax: true,
        deliveryCharge: true,
        subtotal: true,
        totalAmount: true,
        orderDate: true,
        orderStatus: true,
        product: {
          select: {
            id: true,
            product_name: true,
            product_code: true,
          },
        },
        orderBy: {
          select: {
            id: true,
            email: true,
            mobile: true,
            username: true,
          },
        },
        zone: {
          select: {
            id: true,
            zone_name: true,
            contact_no: true,
          },
        },
        customer: {
          select: {
            id: true,
            firstName: true,
            lastName: true,
            role: true,
            userUniqueId: true,
          },
        },
        payment_info: true,
        shipping_info: true,
      },
    }),
    pagination
      ? db.product_order.count({
          where: {
            ...(vendorId && { vendorId }),
            ...(status && { orderStatus: status }),
            ...(orderById && { orderBy: { id: orderById } }),
            ...(zoneId && { zoneId }),
            ...(productId && { productId }),
            ...(dateForFilter && {
              orderDate: {
                gte: dateForFilter.startDate,
                lte: dateForFilter.endDate,
              },
            }),
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

export const createProductOrder = async ({
  productId,
  vendorId,
  quantity,
  unitPrice,
  discount,
  tax,
  deliveryCharge,
  subtotal,
  totalAmount,
  orderById,
  zoneId,
  customerId,
}: CREATE_PRODUCT_ORDER_TYPE_BODY) => {
  const order = await db.product_order.create({
    data: {
      productId,
      vendorId,
      quantity,
      unitPrice,
      discount,
      tax,
      deliveryCharge,
      subtotal,
      totalAmount,
      orderById,
      zoneId,
      ...(customerId && { customerId }),
    },
  });

  //update product inventory
  if (order?.productId) {
    (async () => {
      try {
        await updateProductInventory({
          order,
          zoneId,
        });
      } catch (error) {
        console.error(error);
      }
    })();
  }

  return order;
};

const updateProductInventory = async ({
  order,
  zoneId,
}: {
  order: any;
  zoneId: string;
}) => {
  await db.product_inventory.update({
    where: {
      productId: order?.productId,
      zoneId,
    },
    data: {
      stockAvailable: {
        decrement: order?.quantity,
      },
      quantitySold: {
        increment: order?.quantity,
      },
      product: {
        update: {
          total_order_placed: {
            increment: 1,
          },
        },
      },
    },
  });

  //get product_stock_report by productId and zoneId
  const productStockReport = await processOrderForProduct(
    order?.productId,
    zoneId,
    order?.quantity
  );

  return productStockReport;
};
