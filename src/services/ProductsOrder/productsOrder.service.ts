import { CREATE_PRODUCT_ORDER_TYPE_BODY } from "../../routes/Products_order/products_order";
import { db } from "../../utils/db.server";
import {
  getAllProductStockPurchaseReportByProductId,
  processOrderForProduct,
} from "../Reports/productPurchaseReport.service";

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
  otherUsersId,
  zoneId,
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
      otherUsersId,
      zoneId,
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
