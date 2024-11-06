/*
  Warnings:

  - Added the required column `zoneId` to the `product_stock_report` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "product_stock_report" ADD COLUMN     "zoneId" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "product_stock_report" ADD CONSTRAINT "product_stock_report_zoneId_fkey" FOREIGN KEY ("zoneId") REFERENCES "zone"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
