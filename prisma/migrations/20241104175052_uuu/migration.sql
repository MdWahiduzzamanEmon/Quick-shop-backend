/*
  Warnings:

  - Added the required column `vendorId` to the `product_stock_report` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "product_stock_report" ADD COLUMN     "vendorId" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "product_stock_report" ADD CONSTRAINT "product_stock_report_vendorId_fkey" FOREIGN KEY ("vendorId") REFERENCES "vendor"("id") ON DELETE CASCADE ON UPDATE CASCADE;
