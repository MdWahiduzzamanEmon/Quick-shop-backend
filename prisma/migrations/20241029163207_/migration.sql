/*
  Warnings:

  - You are about to drop the column `userId` on the `admin` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[adminId]` on the table `vendor` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `adminId` to the `vendor` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "admin" DROP CONSTRAINT "admin_userId_fkey";

-- DropIndex
DROP INDEX "admin_id_userId_role_isActive_idx";

-- DropIndex
DROP INDEX "admin_userId_key";

-- AlterTable
ALTER TABLE "admin" DROP COLUMN "userId";

-- AlterTable
ALTER TABLE "vendor" ADD COLUMN     "adminId" TEXT NOT NULL;

-- CreateIndex
CREATE INDEX "admin_id_role_isActive_idx" ON "admin"("id", "role", "isActive");

-- CreateIndex
CREATE UNIQUE INDEX "vendor_adminId_key" ON "vendor"("adminId");

-- AddForeignKey
ALTER TABLE "vendor" ADD CONSTRAINT "vendor_adminId_fkey" FOREIGN KEY ("adminId") REFERENCES "admin"("id") ON DELETE CASCADE ON UPDATE CASCADE;
