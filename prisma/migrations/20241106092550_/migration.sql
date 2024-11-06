-- CreateEnum
CREATE TYPE "product_order_status" AS ENUM ('PENDING', 'PROCESSING', 'SHIPPED', 'DELIVERED', 'CANCELLED');

-- CreateEnum
CREATE TYPE "payment_status" AS ENUM ('PENDING', 'PAID', 'REFUNDED');

-- DropIndex
DROP INDEX "product_stock_purchase_id_purchase_date_supplierId_productI_idx";

-- AlterTable
ALTER TABLE "product" ADD COLUMN     "total_order_placed" INTEGER NOT NULL DEFAULT 0;

-- CreateTable
CREATE TABLE "product_order" (
    "id" TEXT NOT NULL,
    "productId" TEXT NOT NULL,
    "product_order_quantity" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "vendorId" TEXT NOT NULL,
    "orderDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "otherUsersId" TEXT,
    "order_status" "product_order_status" NOT NULL DEFAULT 'PENDING',
    "totalAmount" DOUBLE PRECISION NOT NULL DEFAULT 0.0,
    "discount" DOUBLE PRECISION DEFAULT 0.0,
    "shippingAddress" TEXT,
    "shippingDate" TIMESTAMP(3),
    "estimatedDeliveryDate" TIMESTAMP(3),
    "trackingNumber" TEXT,
    "paymentStatus" "payment_status" NOT NULL DEFAULT 'PENDING',
    "paymentMethod" TEXT,
    "paymentDate" TIMESTAMP(3),
    "notes" TEXT,
    "isCancelled" BOOLEAN NOT NULL DEFAULT false,
    "cancelReason" TEXT,

    CONSTRAINT "product_order_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "product_order_id_productId_createdAt_updatedAt_orderDate_or_idx" ON "product_order"("id", "productId", "createdAt", "updatedAt", "orderDate", "order_status", "vendorId", "otherUsersId");

-- CreateIndex
CREATE INDEX "product_stock_purchase_id_purchase_date_supplierId_productI_idx" ON "product_stock_purchase"("id", "purchase_date", "supplierId", "productId", "zoneId", "vendorId", "createdById", "purchaseUniqueId");

-- AddForeignKey
ALTER TABLE "product_order" ADD CONSTRAINT "product_order_productId_fkey" FOREIGN KEY ("productId") REFERENCES "product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_order" ADD CONSTRAINT "product_order_vendorId_fkey" FOREIGN KEY ("vendorId") REFERENCES "vendor"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_order" ADD CONSTRAINT "product_order_otherUsersId_fkey" FOREIGN KEY ("otherUsersId") REFERENCES "otherUsers"("id") ON DELETE SET NULL ON UPDATE CASCADE;
