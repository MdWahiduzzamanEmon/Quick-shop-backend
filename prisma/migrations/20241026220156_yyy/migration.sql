/*
  Warnings:

  - You are about to drop the column `image` on the `product` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `product` table. All the data in the column will be lost.
  - You are about to drop the column `price` on the `product` table. All the data in the column will be lost.
  - Added the required column `product_name` to the `product` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "product_quantity_type" AS ENUM ('KG', 'LITRE', 'UNIT');

-- CreateEnum
CREATE TYPE "delivery_charge_type" AS ENUM ('FIXED', 'REGULAR', 'FREE', 'CHARGEABLE');

-- DropIndex
DROP INDEX "product_id_name_isActive_idx";

-- AlterTable
ALTER TABLE "product" DROP COLUMN "image",
DROP COLUMN "name",
DROP COLUMN "price",
ADD COLUMN     "buying_price" DOUBLE PRECISION NOT NULL DEFAULT 0,
ADD COLUMN     "delivery_charge" DOUBLE PRECISION NOT NULL DEFAULT 0,
ADD COLUMN     "delivery_charge_type" "delivery_charge_type" DEFAULT 'REGULAR',
ADD COLUMN     "product_name" TEXT NOT NULL,
ADD COLUMN     "product_quantity_type" "product_quantity_type" NOT NULL DEFAULT 'UNIT',
ADD COLUMN     "selling_price" DOUBLE PRECISION NOT NULL DEFAULT 0,
ALTER COLUMN "stock" SET DEFAULT 0;

-- CreateIndex
CREATE INDEX "product_id_product_name_isActive_idx" ON "product"("id", "product_name", "isActive");
