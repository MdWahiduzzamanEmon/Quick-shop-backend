/*
  Warnings:

  - A unique constraint covering the columns `[srContactNo,supplierUniqueId,supplierName]` on the table `supplier` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX "supplier_dealerContactNo_key";

-- DropIndex
DROP INDEX "supplier_dealerEmail_key";

-- DropIndex
DROP INDEX "supplier_srContactNo_dealerContactNo_dealerEmail_supplierUn_key";

-- CreateIndex
CREATE UNIQUE INDEX "supplier_srContactNo_supplierUniqueId_supplierName_key" ON "supplier"("srContactNo", "supplierUniqueId", "supplierName");
