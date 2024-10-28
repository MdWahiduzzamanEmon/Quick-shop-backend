/*
  Warnings:

  - Added the required column `vendorId` to the `zone` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "zone_id_isActive_idx";

-- AlterTable
ALTER TABLE "zone" ADD COLUMN     "vendorId" TEXT NOT NULL;

-- CreateIndex
CREATE INDEX "zone_id_isActive_division_id_district_id_upazila_id_union_i_idx" ON "zone"("id", "isActive", "division_id", "district_id", "upazila_id", "union_id", "operatorId", "vendorId");

-- AddForeignKey
ALTER TABLE "zone" ADD CONSTRAINT "zone_vendorId_fkey" FOREIGN KEY ("vendorId") REFERENCES "vendor"("id") ON DELETE CASCADE ON UPDATE CASCADE;
