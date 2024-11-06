-- DropForeignKey
ALTER TABLE "product_order" DROP CONSTRAINT "product_order_productId_fkey";

-- DropForeignKey
ALTER TABLE "product_stock_purchase" DROP CONSTRAINT "product_stock_purchase_productId_fkey";

-- DropForeignKey
ALTER TABLE "product_stock_report" DROP CONSTRAINT "product_stock_report_productId_fkey";

-- AddForeignKey
ALTER TABLE "product_stock_purchase" ADD CONSTRAINT "product_stock_purchase_productId_fkey" FOREIGN KEY ("productId") REFERENCES "product"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_order" ADD CONSTRAINT "product_order_productId_fkey" FOREIGN KEY ("productId") REFERENCES "product"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_stock_report" ADD CONSTRAINT "product_stock_report_productId_fkey" FOREIGN KEY ("productId") REFERENCES "product"("id") ON DELETE CASCADE ON UPDATE CASCADE;
