/*
  Warnings:

  - A unique constraint covering the columns `[mobile]` on the table `admin` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `mobile` to the `admin` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "admin" ADD COLUMN     "mobile" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "admin_mobile_key" ON "admin"("mobile");
