-- DropForeignKey
ALTER TABLE "product_order" DROP CONSTRAINT "product_order_id_fkey";

-- AddForeignKey
ALTER TABLE "product_order" ADD CONSTRAINT "product_order_orderById_fkey" FOREIGN KEY ("orderById") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
