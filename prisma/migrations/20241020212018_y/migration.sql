/*
  Warnings:

  - You are about to drop the column `administratorId` on the `logginInfo` table. All the data in the column will be lost.
  - You are about to drop the `adminastators` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "adminastators" DROP CONSTRAINT "adminastators_userId_fkey";

-- DropForeignKey
ALTER TABLE "logginInfo" DROP CONSTRAINT "logginInfo_administratorId_fkey";

-- AlterTable
ALTER TABLE "logginInfo" DROP COLUMN "administratorId";

-- DropTable
DROP TABLE "adminastators";

-- CreateIndex
CREATE INDEX "User_id_idx" ON "User"("id");
