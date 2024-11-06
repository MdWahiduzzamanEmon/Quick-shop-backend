/*
  Warnings:

  - You are about to drop the column `product_c_mrp` on the `product` table. All the data in the column will be lost.
  - You are about to drop the column `product_r_mrp` on the `product` table. All the data in the column will be lost.
  - You are about to drop the column `product_stock` on the `product` table. All the data in the column will be lost.
  - You are about to drop the column `product_stock_limit` on the `product` table. All the data in the column will be lost.
  - You are about to drop the column `product_total_sold` on the `product` table. All the data in the column will be lost.
  - You are about to drop the column `cancelReason` on the `product_order` table. All the data in the column will be lost.
  - You are about to drop the column `estimatedDeliveryDate` on the `product_order` table. All the data in the column will be lost.
  - You are about to drop the column `isCancelled` on the `product_order` table. All the data in the column will be lost.
  - You are about to drop the column `notes` on the `product_order` table. All the data in the column will be lost.
  - You are about to drop the column `order_status` on the `product_order` table. All the data in the column will be lost.
  - You are about to drop the column `paymentDate` on the `product_order` table. All the data in the column will be lost.
  - You are about to drop the column `paymentMethod` on the `product_order` table. All the data in the column will be lost.
  - You are about to drop the column `paymentStatus` on the `product_order` table. All the data in the column will be lost.
  - You are about to drop the column `product_order_quantity` on the `product_order` table. All the data in the column will be lost.
  - You are about to drop the column `shippingAddress` on the `product_order` table. All the data in the column will be lost.
  - You are about to drop the column `shippingDate` on the `product_order` table. All the data in the column will be lost.
  - You are about to drop the column `trackingNumber` on the `product_order` table. All the data in the column will be lost.
  - Added the required column `quantity` to the `product_order` table without a default value. This is not possible if the table is not empty.
  - Added the required column `subtotal` to the `product_order` table without a default value. This is not possible if the table is not empty.
  - Added the required column `unitPrice` to the `product_order` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "shipping_status" AS ENUM ('PENDING', 'SHIPPED', 'IN_TRANSIT', 'DELIVERED', 'RETURNED');

-- AlterEnum
ALTER TYPE "payment_status" ADD VALUE 'FAILED';

-- DropIndex
DROP INDEX "product_order_id_productId_createdAt_updatedAt_orderDate_or_idx";

-- AlterTable
ALTER TABLE "product" DROP COLUMN "product_c_mrp",
DROP COLUMN "product_r_mrp",
DROP COLUMN "product_stock",
DROP COLUMN "product_stock_limit",
DROP COLUMN "product_total_sold";

-- AlterTable
ALTER TABLE "product_order" DROP COLUMN "cancelReason",
DROP COLUMN "estimatedDeliveryDate",
DROP COLUMN "isCancelled",
DROP COLUMN "notes",
DROP COLUMN "order_status",
DROP COLUMN "paymentDate",
DROP COLUMN "paymentMethod",
DROP COLUMN "paymentStatus",
DROP COLUMN "product_order_quantity",
DROP COLUMN "shippingAddress",
DROP COLUMN "shippingDate",
DROP COLUMN "trackingNumber",
ADD COLUMN     "deliveryCharge" DOUBLE PRECISION DEFAULT 0.0,
ADD COLUMN     "orderStatus" "product_order_status" NOT NULL DEFAULT 'PENDING',
ADD COLUMN     "quantity" INTEGER NOT NULL,
ADD COLUMN     "subtotal" DOUBLE PRECISION NOT NULL,
ADD COLUMN     "tax" DOUBLE PRECISION DEFAULT 0.0,
ADD COLUMN     "unitPrice" DOUBLE PRECISION NOT NULL,
ALTER COLUMN "totalAmount" DROP DEFAULT;

-- CreateTable
CREATE TABLE "product_inventory" (
    "id" TEXT NOT NULL,
    "productId" TEXT NOT NULL,
    "stockAvailable" INTEGER NOT NULL DEFAULT 0,
    "quantitySold" INTEGER NOT NULL DEFAULT 0,
    "productStockLimit" INTEGER NOT NULL DEFAULT 5,
    "productCustomerPrice" DOUBLE PRECISION NOT NULL DEFAULT 0.0,
    "productRetailPrice" DOUBLE PRECISION NOT NULL DEFAULT 0.0,
    "lastUpdated" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "product_inventory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "shipping_info" (
    "id" TEXT NOT NULL,
    "orderId" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "shippingDate" TIMESTAMP(3),
    "estimatedDeliveryDate" TIMESTAMP(3),
    "trackingNumber" TEXT,
    "shippingStatus" "shipping_status" NOT NULL DEFAULT 'PENDING',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "shipping_info_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "payment_info" (
    "id" TEXT NOT NULL,
    "orderId" TEXT NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,
    "discount" DOUBLE PRECISION DEFAULT 0.0,
    "paymentMethod" TEXT,
    "paymentDate" TIMESTAMP(3),
    "paymentStatus" "payment_status" NOT NULL DEFAULT 'PENDING',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "payment_info_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "product_inventory_productId_key" ON "product_inventory"("productId");

-- CreateIndex
CREATE INDEX "product_inventory_id_productId_idx" ON "product_inventory"("id", "productId");

-- CreateIndex
CREATE UNIQUE INDEX "shipping_info_orderId_key" ON "shipping_info"("orderId");

-- CreateIndex
CREATE INDEX "shipping_info_orderId_shippingStatus_idx" ON "shipping_info"("orderId", "shippingStatus");

-- CreateIndex
CREATE UNIQUE INDEX "payment_info_orderId_key" ON "payment_info"("orderId");

-- CreateIndex
CREATE INDEX "payment_info_orderId_paymentStatus_idx" ON "payment_info"("orderId", "paymentStatus");

-- CreateIndex
CREATE INDEX "product_order_id_productId_createdAt_updatedAt_orderDate_or_idx" ON "product_order"("id", "productId", "createdAt", "updatedAt", "orderDate", "orderStatus", "vendorId", "otherUsersId");

-- AddForeignKey
ALTER TABLE "product_inventory" ADD CONSTRAINT "product_inventory_productId_fkey" FOREIGN KEY ("productId") REFERENCES "product"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "shipping_info" ADD CONSTRAINT "shipping_info_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "product_order"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment_info" ADD CONSTRAINT "payment_info_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "product_order"("id") ON DELETE CASCADE ON UPDATE CASCADE;
