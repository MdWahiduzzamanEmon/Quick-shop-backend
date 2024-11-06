/*
  Warnings:

  - Added the required column `vendorId` to the `product_order` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "product_order_id_productId_createdAt_updatedAt_orderDate_or_idx";

-- AlterTable
ALTER TABLE "product_order" ADD COLUMN     "vendorId" TEXT NOT NULL;

-- CreateIndex
CREATE INDEX "product_order_id_productId_createdAt_updatedAt_orderDate_or_idx" ON "product_order"("id", "productId", "createdAt", "updatedAt", "orderDate", "orderStatus", "vendorId", "otherUsersId");

-- AddForeignKey
ALTER TABLE "product_order" ADD CONSTRAINT "product_order_vendorId_fkey" FOREIGN KEY ("vendorId") REFERENCES "vendor"("id") ON DELETE CASCADE ON UPDATE CASCADE;
