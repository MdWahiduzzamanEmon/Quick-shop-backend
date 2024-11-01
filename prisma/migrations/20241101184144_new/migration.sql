/*
  Warnings:

  - Added the required column `vendorId` to the `supplier` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "supplier" DROP CONSTRAINT "supplier_userId_fkey";

-- AlterTable
ALTER TABLE "supplier" ADD COLUMN     "vendorId" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "supplier" ADD CONSTRAINT "supplier_vendorId_fkey" FOREIGN KEY ("vendorId") REFERENCES "vendor"("id") ON DELETE CASCADE ON UPDATE CASCADE;
