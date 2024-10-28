/*
  Warnings:

  - Added the required column `createdById` to the `zone` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `zone` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "zone" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "createdById" TEXT NOT NULL,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- CreateIndex
CREATE INDEX "zone_id_isActive_idx" ON "zone"("id", "isActive");

-- AddForeignKey
ALTER TABLE "zone" ADD CONSTRAINT "zone_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
