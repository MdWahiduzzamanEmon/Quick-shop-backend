/*
  Warnings:

  - You are about to drop the column `otherUsersId` on the `product_order` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "product_order" DROP CONSTRAINT "product_order_otherUsersId_fkey";

-- AlterTable
ALTER TABLE "product_order" DROP COLUMN "otherUsersId";

-- AddForeignKey
ALTER TABLE "product_order" ADD CONSTRAINT "product_order_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "otherUsers"("id") ON DELETE SET NULL ON UPDATE CASCADE;
