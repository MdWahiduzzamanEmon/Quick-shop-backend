/*
  Warnings:

  - You are about to drop the column `email` on the `admin` table. All the data in the column will be lost.
  - You are about to drop the column `firstName` on the `admin` table. All the data in the column will be lost.
  - You are about to drop the column `lastName` on the `admin` table. All the data in the column will be lost.
  - You are about to drop the column `mobile` on the `admin` table. All the data in the column will be lost.
  - You are about to drop the column `password` on the `admin` table. All the data in the column will be lost.
  - You are about to drop the column `username` on the `admin` table. All the data in the column will be lost.
  - You are about to drop the column `adminId` on the `vendor` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[userId]` on the table `admin` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `userId` to the `admin` table without a default value. This is not possible if the table is not empty.
  - Added the required column `superAdminId` to the `vendor` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "vendor" DROP CONSTRAINT "vendor_adminId_fkey";

-- DropIndex
DROP INDEX "admin_email_key";

-- DropIndex
DROP INDEX "admin_mobile_key";

-- DropIndex
DROP INDEX "admin_username_key";

-- AlterTable
ALTER TABLE "admin" DROP COLUMN "email",
DROP COLUMN "firstName",
DROP COLUMN "lastName",
DROP COLUMN "mobile",
DROP COLUMN "password",
DROP COLUMN "username",
ADD COLUMN     "userId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "vendor" DROP COLUMN "adminId",
ADD COLUMN     "superAdminId" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "superAdmin" (
    "id" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "mobile" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "role" TEXT NOT NULL DEFAULT 'SUPER_ADMIN',
    "isActive" "User_status" NOT NULL DEFAULT 'ACTIVE',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "superAdmin_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "superAdmin_email_key" ON "superAdmin"("email");

-- CreateIndex
CREATE UNIQUE INDEX "superAdmin_mobile_key" ON "superAdmin"("mobile");

-- CreateIndex
CREATE UNIQUE INDEX "superAdmin_username_key" ON "superAdmin"("username");

-- CreateIndex
CREATE INDEX "superAdmin_id_role_isActive_idx" ON "superAdmin"("id", "role", "isActive");

-- CreateIndex
CREATE UNIQUE INDEX "admin_userId_key" ON "admin"("userId");

-- AddForeignKey
ALTER TABLE "vendor" ADD CONSTRAINT "vendor_superAdminId_fkey" FOREIGN KEY ("superAdminId") REFERENCES "superAdmin"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "admin" ADD CONSTRAINT "admin_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;
