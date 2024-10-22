/*
  Warnings:

  - You are about to drop the column `email` on the `workers` table. All the data in the column will be lost.
  - You are about to drop the column `mobile` on the `workers` table. All the data in the column will be lost.
  - You are about to drop the column `password` on the `workers` table. All the data in the column will be lost.
  - You are about to drop the column `surname` on the `workers` table. All the data in the column will be lost.
  - You are about to drop the `allUsers` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[email]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[mobile]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[username]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `email` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `mobile` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `password` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `username` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "allUsers" DROP CONSTRAINT "allUsers_userId_fkey";

-- DropForeignKey
ALTER TABLE "logginInfo" DROP CONSTRAINT "logginInfo_otherUsersId_fkey";

-- DropIndex
DROP INDEX "User_id_idx";

-- DropIndex
DROP INDEX "workers_email_key";

-- DropIndex
DROP INDEX "workers_id_employeeID_mobile_NID_accountNumber_mobileBankin_idx";

-- DropIndex
DROP INDEX "workers_mobile_key";

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "email" TEXT NOT NULL,
ADD COLUMN     "mobile" TEXT NOT NULL,
ADD COLUMN     "password" TEXT NOT NULL,
ADD COLUMN     "username" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "workers" DROP COLUMN "email",
DROP COLUMN "mobile",
DROP COLUMN "password",
DROP COLUMN "surname";

-- DropTable
DROP TABLE "allUsers";

-- CreateTable
CREATE TABLE "otherUsers" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "firstName" TEXT,
    "lastName" TEXT,
    "profile_picture" JSONB NOT NULL DEFAULT '{}',
    "role" "Role" NOT NULL DEFAULT 'GENERAL_USER',
    "isActive" "user_status" NOT NULL DEFAULT 'ACTIVE',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "otherUsers_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "otherUsers_userId_key" ON "otherUsers"("userId");

-- CreateIndex
CREATE INDEX "otherUsers_id_userId_role_isActive_idx" ON "otherUsers"("id", "userId", "role", "isActive");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "User_mobile_key" ON "User"("mobile");

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");

-- CreateIndex
CREATE INDEX "User_id_email_mobile_username_idx" ON "User"("id", "email", "mobile", "username");

-- CreateIndex
CREATE INDEX "workers_id_userId_role_isActive_NID_employeeID_whatsapp_idx" ON "workers"("id", "userId", "role", "isActive", "NID", "employeeID", "whatsapp");

-- AddForeignKey
ALTER TABLE "otherUsers" ADD CONSTRAINT "otherUsers_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "logginInfo" ADD CONSTRAINT "logginInfo_otherUsersId_fkey" FOREIGN KEY ("otherUsersId") REFERENCES "otherUsers"("id") ON DELETE SET NULL ON UPDATE CASCADE;
