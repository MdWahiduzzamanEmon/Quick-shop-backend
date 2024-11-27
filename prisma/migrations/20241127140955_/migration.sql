/*
  Warnings:

  - You are about to drop the column `otherUsersId` on the `product_order` table. All the data in the column will be lost.
  - Added the required column `orderById` to the `product_order` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "order_type" AS ENUM ('FACE_TO_FACE', 'PHONE_CALL', 'WHATSAPP', 'MESSENGER', 'WEBSITE', 'APP');

-- CreateEnum
CREATE TYPE "delivery_type" AS ENUM ('POS', 'HOME_DELIVERY');

-- DropForeignKey
ALTER TABLE "product_order" DROP CONSTRAINT "product_order_otherUsersId_fkey";

-- DropIndex
DROP INDEX "product_order_id_productId_createdAt_updatedAt_orderDate_or_idx";

-- AlterTable
ALTER TABLE "product_order" DROP COLUMN "otherUsersId",
ADD COLUMN     "deliveryType" "delivery_type" NOT NULL DEFAULT 'HOME_DELIVERY',
ADD COLUMN     "orderById" TEXT NOT NULL,
ADD COLUMN     "orderType" "order_type" NOT NULL DEFAULT 'WEBSITE';

-- CreateIndex
CREATE INDEX "product_order_id_productId_createdAt_updatedAt_orderDate_or_idx" ON "product_order"("id", "productId", "createdAt", "updatedAt", "orderDate", "orderStatus", "vendorId", "zoneId", "orderById");

-- AddForeignKey
ALTER TABLE "product_order" ADD CONSTRAINT "product_order_id_fkey" FOREIGN KEY ("id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;
