/*
  Warnings:

  - A unique constraint covering the columns `[product_code]` on the table `product` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `product_code` to the `product` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "product" ADD COLUMN     "product_code" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "product_product_code_key" ON "product"("product_code");
