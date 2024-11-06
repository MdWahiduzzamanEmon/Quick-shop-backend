/*
  Warnings:

  - You are about to drop the column `vendorId` on the `product_order` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "product_order" DROP CONSTRAINT "product_order_vendorId_fkey";

-- DropIndex
DROP INDEX "product_order_id_productId_createdAt_updatedAt_orderDate_or_idx";

-- AlterTable
ALTER TABLE "product_order" DROP COLUMN "vendorId";

-- CreateIndex
CREATE INDEX "product_order_id_productId_createdAt_updatedAt_orderDate_or_idx" ON "product_order"("id", "productId", "createdAt", "updatedAt", "orderDate", "orderStatus", "otherUsersId");
