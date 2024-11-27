-- AlterTable
ALTER TABLE "product_order" ADD COLUMN     "customerId" TEXT,
ADD COLUMN     "otherUsersId" TEXT;

-- AddForeignKey
ALTER TABLE "product_order" ADD CONSTRAINT "product_order_otherUsersId_fkey" FOREIGN KEY ("otherUsersId") REFERENCES "otherUsers"("id") ON DELETE SET NULL ON UPDATE CASCADE;
