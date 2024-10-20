/*
  Warnings:

  - A unique constraint covering the columns `[username]` on the table `adminastators` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `username` to the `adminastators` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "adminastators_userId_email_mobile_idx";

-- AlterTable
ALTER TABLE "adminastators" ADD COLUMN     "username" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "adminastators_username_key" ON "adminastators"("username");

-- CreateIndex
CREATE INDEX "adminastators_userId_email_mobile_username_idx" ON "adminastators"("userId", "email", "mobile", "username");
