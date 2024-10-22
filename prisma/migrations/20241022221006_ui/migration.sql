/*
  Warnings:

  - You are about to drop the column `otherUsersId` on the `logginInfo` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "logginInfo" DROP CONSTRAINT "logginInfo_otherUsersId_fkey";

-- DropIndex
DROP INDEX "logginInfo_userId_otherUsersId_status_idx";

-- AlterTable
ALTER TABLE "logginInfo" DROP COLUMN "otherUsersId";

-- AlterTable
ALTER TABLE "workers" ALTER COLUMN "education" SET DEFAULT '',
ALTER COLUMN "bankName" SET DEFAULT '',
ALTER COLUMN "branchName" SET DEFAULT '',
ALTER COLUMN "accountNumber" SET DEFAULT '',
ALTER COLUMN "mobileBanking" SET DEFAULT '',
ALTER COLUMN "mobileBankingNumber" SET DEFAULT '',
ALTER COLUMN "address" SET DEFAULT '',
ALTER COLUMN "zipCode" SET DEFAULT '';

-- CreateIndex
CREATE INDEX "logginInfo_userId_status_idx" ON "logginInfo"("userId", "status");
