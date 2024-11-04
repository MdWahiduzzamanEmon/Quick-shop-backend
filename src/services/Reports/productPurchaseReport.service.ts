import { db } from "../../utils/db.server";

export const getAllProductStockPurchaseReport = async ({
  vendorId,
}: {
  vendorId: string;
}) => {
  return await db.product_stock_report.findMany({
    where: {
      vendorId,
    },
    orderBy: {
      createdAt: "desc",
    },
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
  });
};
