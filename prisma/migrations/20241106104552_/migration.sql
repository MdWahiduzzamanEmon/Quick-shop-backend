/*
  Warnings:

  - Added the required column `zoneId` to the `product_inventory` table without a default value. This is not possible if the table is not empty.
  - Added the required column `zoneId` to the `product_order` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "product_inventory_id_productId_idx";

-- AlterTable
ALTER TABLE "product_inventory" ADD COLUMN     "zoneId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "product_order" ADD COLUMN     "zoneId" TEXT NOT NULL;

-- CreateIndex
CREATE INDEX "product_inventory_id_productId_zoneId_idx" ON "product_inventory"("id", "productId", "zoneId");

-- AddForeignKey
ALTER TABLE "product_inventory" ADD CONSTRAINT "product_inventory_zoneId_fkey" FOREIGN KEY ("zoneId") REFERENCES "zone"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_order" ADD CONSTRAINT "product_order_zoneId_fkey" FOREIGN KEY ("zoneId") REFERENCES "zone"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
