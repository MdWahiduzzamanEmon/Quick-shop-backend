/*
  Warnings:

  - You are about to drop the column `address` on the `supplier` table. All the data in the column will be lost.
  - You are about to drop the column `fullName` on the `supplier` table. All the data in the column will be lost.
  - You are about to drop the column `profile_picture` on the `supplier` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `supplier` table. All the data in the column will be lost.
  - You are about to drop the column `whatsapp` on the `supplier` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[srContactNo]` on the table `supplier` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[dealerContactNo]` on the table `supplier` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[dealerEmail]` on the table `supplier` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[supplierUniqueId]` on the table `supplier` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[srContactNo,dealerContactNo,dealerEmail,supplierUniqueId]` on the table `supplier` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `dealerAddress` to the `supplier` table without a default value. This is not possible if the table is not empty.
  - Added the required column `dealerContactNo` to the `supplier` table without a default value. This is not possible if the table is not empty.
  - Added the required column `dealerEmail` to the `supplier` table without a default value. This is not possible if the table is not empty.
  - Added the required column `dealerName` to the `supplier` table without a default value. This is not possible if the table is not empty.
  - Added the required column `srContactNo` to the `supplier` table without a default value. This is not possible if the table is not empty.
  - Added the required column `srWhatsappNo` to the `supplier` table without a default value. This is not possible if the table is not empty.
  - Added the required column `supplierUniqueId` to the `supplier` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "supplier_id_userId_isActive_idx";

-- DropIndex
DROP INDEX "supplier_userId_key";

-- AlterTable
ALTER TABLE "supplier" DROP COLUMN "address",
DROP COLUMN "fullName",
DROP COLUMN "profile_picture",
DROP COLUMN "userId",
DROP COLUMN "whatsapp",
ADD COLUMN     "companyLogo" JSONB NOT NULL DEFAULT '{}',
ADD COLUMN     "dealerAddress" TEXT NOT NULL,
ADD COLUMN     "dealerContactNo" TEXT NOT NULL,
ADD COLUMN     "dealerEmail" TEXT NOT NULL,
ADD COLUMN     "dealerName" TEXT NOT NULL,
ADD COLUMN     "srContactNo" TEXT NOT NULL,
ADD COLUMN     "srName" TEXT,
ADD COLUMN     "srPhoto" JSONB NOT NULL DEFAULT '{}',
ADD COLUMN     "srWhatsappNo" TEXT NOT NULL,
ADD COLUMN     "supplierName" TEXT,
ADD COLUMN     "supplierUniqueId" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "supplier_srContactNo_key" ON "supplier"("srContactNo");

-- CreateIndex
CREATE UNIQUE INDEX "supplier_dealerContactNo_key" ON "supplier"("dealerContactNo");

-- CreateIndex
CREATE UNIQUE INDEX "supplier_dealerEmail_key" ON "supplier"("dealerEmail");

-- CreateIndex
CREATE UNIQUE INDEX "supplier_supplierUniqueId_key" ON "supplier"("supplierUniqueId");

-- CreateIndex
CREATE INDEX "supplier_id_role_isActive_supplierUniqueId_srContactNo_deal_idx" ON "supplier"("id", "role", "isActive", "supplierUniqueId", "srContactNo", "dealerContactNo", "dealerEmail");

-- CreateIndex
CREATE UNIQUE INDEX "supplier_srContactNo_dealerContactNo_dealerEmail_supplierUn_key" ON "supplier"("srContactNo", "dealerContactNo", "dealerEmail", "supplierUniqueId");
