/*
  Warnings:

  - You are about to drop the column `product_mrp` on the `product` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "product" DROP COLUMN "product_mrp",
ADD COLUMN     "product_c_mrp" DOUBLE PRECISION NOT NULL DEFAULT 0,
ADD COLUMN     "product_r_mrp" DOUBLE PRECISION NOT NULL DEFAULT 0;

-- AlterTable
ALTER TABLE "product_stock_report" ADD COLUMN     "product_retail_price" DOUBLE PRECISION NOT NULL DEFAULT 0;
