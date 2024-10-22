/*
  Warnings:

  - You are about to drop the column `profileImage` on the `workers` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[email]` on the table `workers` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX "workers_id_employeeID_mobile_NID_accountNumber_mobileBankin_idx";

-- AlterTable
ALTER TABLE "workers" DROP COLUMN "profileImage",
ADD COLUMN     "email" TEXT,
ADD COLUMN     "profile_picture" JSONB NOT NULL DEFAULT '{}';

-- CreateIndex
CREATE UNIQUE INDEX "workers_email_key" ON "workers"("email");

-- CreateIndex
CREATE INDEX "workers_id_employeeID_mobile_NID_accountNumber_mobileBankin_idx" ON "workers"("id", "employeeID", "mobile", "NID", "accountNumber", "mobileBankingNumber", "userId", "email");
