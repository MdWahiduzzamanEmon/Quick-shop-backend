-- DropForeignKey
ALTER TABLE "product_stock_report" DROP CONSTRAINT "product_stock_report_product_stock_purchaseId_fkey";

-- AddForeignKey
ALTER TABLE "product_stock_report" ADD CONSTRAINT "product_stock_report_product_stock_purchaseId_fkey" FOREIGN KEY ("product_stock_purchaseId") REFERENCES "product_stock_purchase"("id") ON DELETE CASCADE ON UPDATE CASCADE;
