/*
  Warnings:

  - You are about to drop the column `discount` on the `product_order` table. All the data in the column will be lost.
  - You are about to drop the column `productId` on the `product_order` table. All the data in the column will be lost.
  - You are about to drop the column `quantity` on the `product_order` table. All the data in the column will be lost.
  - You are about to drop the column `unitPrice` on the `product_order` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "product_order" DROP CONSTRAINT "product_order_productId_fkey";

-- DropIndex
DROP INDEX "product_order_id_productId_createdAt_updatedAt_orderDate_or_idx";

-- AlterTable
ALTER TABLE "product_order" DROP COLUMN "discount",
DROP COLUMN "productId",
DROP COLUMN "quantity",
DROP COLUMN "unitPrice";

-- CreateTable
CREATE TABLE "order_products" (
    "id" TEXT NOT NULL,
    "productId" TEXT NOT NULL,
    "quantity" INTEGER NOT NULL,
    "unitPrice" DOUBLE PRECISION NOT NULL,
    "discount" DOUBLE PRECISION NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "product_orderId" TEXT,

    CONSTRAINT "order_products_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "product_order_id_createdAt_updatedAt_orderDate_orderStatus__idx" ON "product_order"("id", "createdAt", "updatedAt", "orderDate", "orderStatus", "vendorId", "zoneId", "orderById");

-- AddForeignKey
ALTER TABLE "order_products" ADD CONSTRAINT "order_products_productId_fkey" FOREIGN KEY ("productId") REFERENCES "product"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order_products" ADD CONSTRAINT "order_products_product_orderId_fkey" FOREIGN KEY ("product_orderId") REFERENCES "product_order"("id") ON DELETE SET NULL ON UPDATE CASCADE;
