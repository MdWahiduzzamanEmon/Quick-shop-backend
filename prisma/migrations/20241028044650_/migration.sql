/*
  Warnings:

  - The values [SUPPLIER] on the enum `Role` will be removed. If these variants are still used in the database, this will fail.
  - The values [LITRE] on the enum `product_quantity_type` will be removed. If these variants are still used in the database, this will fail.
  - You are about to drop the column `buying_price` on the `product` table. All the data in the column will be lost.
  - You are about to drop the column `delivery_charge` on the `product` table. All the data in the column will be lost.
  - You are about to drop the column `selling_price` on the `product` table. All the data in the column will be lost.
  - You are about to drop the column `stock` on the `product` table. All the data in the column will be lost.
  - Made the column `delivery_charge_type` on table `product` required. This step will fail if there are existing NULL values in that column.
  - Added the required column `createdById` to the `product_category` table without a default value. This is not possible if the table is not empty.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "Role_new" AS ENUM ('GENERAL_USER', 'RETAILER');
ALTER TABLE "otherUsers" ALTER COLUMN "role" DROP DEFAULT;
ALTER TABLE "otherUsers" ALTER COLUMN "role" TYPE "Role_new" USING ("role"::text::"Role_new");
ALTER TYPE "Role" RENAME TO "Role_old";
ALTER TYPE "Role_new" RENAME TO "Role";
DROP TYPE "Role_old";
ALTER TABLE "otherUsers" ALTER COLUMN "role" SET DEFAULT 'GENERAL_USER';
COMMIT;

-- AlterEnum
BEGIN;
CREATE TYPE "product_quantity_type_new" AS ENUM ('UNIT', 'PIECE', 'KG', 'GRAM', 'PER', 'DOZEN', 'BOX', 'CASE', 'FEET', 'LITER', 'SET');
ALTER TABLE "product" ALTER COLUMN "product_quantity_type" DROP DEFAULT;
ALTER TABLE "product" ALTER COLUMN "product_quantity_type" TYPE "product_quantity_type_new" USING ("product_quantity_type"::text::"product_quantity_type_new");
ALTER TYPE "product_quantity_type" RENAME TO "product_quantity_type_old";
ALTER TYPE "product_quantity_type_new" RENAME TO "product_quantity_type";
DROP TYPE "product_quantity_type_old";
COMMIT;

-- AlterTable
ALTER TABLE "product" DROP COLUMN "buying_price",
DROP COLUMN "delivery_charge",
DROP COLUMN "selling_price",
DROP COLUMN "stock",
ALTER COLUMN "delivery_charge_type" SET NOT NULL,
ALTER COLUMN "delivery_charge_type" DROP DEFAULT,
ALTER COLUMN "product_quantity_type" DROP DEFAULT;

-- AlterTable
ALTER TABLE "product_category" ADD COLUMN     "createdById" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "supplier" (
    "id" TEXT NOT NULL,
    "fullName" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "whatsapp" TEXT NOT NULL,
    "profile_picture" JSONB NOT NULL DEFAULT '{}',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "isActive" "User_status" NOT NULL DEFAULT 'ACTIVE',
    "userId" TEXT NOT NULL,
    "role" TEXT NOT NULL DEFAULT 'SUPPLIER',

    CONSTRAINT "supplier_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "supplier_userId_key" ON "supplier"("userId");

-- CreateIndex
CREATE INDEX "supplier_id_userId_isActive_idx" ON "supplier"("id", "userId", "isActive");

-- AddForeignKey
ALTER TABLE "supplier" ADD CONSTRAINT "supplier_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_category" ADD CONSTRAINT "product_category_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
