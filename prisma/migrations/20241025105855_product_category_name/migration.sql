/*
  Warnings:

  - You are about to drop the column `product_name` on the `product_category` table. All the data in the column will be lost.
  - Added the required column `product_category_name` to the `product_category` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "product_category_id_product_name_isActive_idx";

-- AlterTable
ALTER TABLE "product_category" DROP COLUMN "product_name",
ADD COLUMN     "product_category_name" TEXT NOT NULL;

-- CreateIndex
CREATE INDEX "product_category_id_product_category_name_isActive_idx" ON "product_category"("id", "product_category_name", "isActive");
