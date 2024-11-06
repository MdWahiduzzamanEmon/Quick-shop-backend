-- DropIndex
DROP INDEX "product_id_product_name_isActive_idx";

-- AlterTable
ALTER TABLE "product" ADD COLUMN     "isProductPurchased" BOOLEAN NOT NULL DEFAULT false;

-- CreateIndex
CREATE INDEX "product_id_product_name_isActive_isProductPurchased_idx" ON "product"("id", "product_name", "isActive", "isProductPurchased");
