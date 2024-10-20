/*
  Warnings:

  - The `isActive` column on the `adminastators` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- CreateEnum
CREATE TYPE "user_status" AS ENUM ('ACTIVE', 'INACTIVE', 'PENDING', 'SUSPENDED', 'DELETED');

-- CreateEnum
CREATE TYPE "loggin_status" AS ENUM ('SUCCESS', 'FAILED');

-- AlterTable
ALTER TABLE "adminastators" DROP COLUMN "isActive",
ADD COLUMN     "isActive" "user_status" NOT NULL DEFAULT 'ACTIVE';

-- CreateTable
CREATE TABLE "allUsers" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "firstName" TEXT,
    "lastName" TEXT,
    "username" TEXT NOT NULL,
    "mobile" TEXT NOT NULL,
    "profile_picture" JSONB NOT NULL DEFAULT '{}',
    "password" TEXT NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'GENERAL_USER',
    "isActive" "user_status" NOT NULL DEFAULT 'ACTIVE',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "allUsers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "logginInfo" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "ipAddress" TEXT,
    "device" TEXT,
    "browser" TEXT,
    "os" TEXT,
    "location" TEXT,
    "status" "loggin_status" NOT NULL,
    "loginAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "logginInfo_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "allUsers_userId_key" ON "allUsers"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "allUsers_email_key" ON "allUsers"("email");

-- CreateIndex
CREATE UNIQUE INDEX "allUsers_username_key" ON "allUsers"("username");

-- CreateIndex
CREATE UNIQUE INDEX "allUsers_mobile_key" ON "allUsers"("mobile");

-- CreateIndex
CREATE INDEX "allUsers_userId_email_mobile_username_idx" ON "allUsers"("userId", "email", "mobile", "username");

-- CreateIndex
CREATE UNIQUE INDEX "logginInfo_userId_key" ON "logginInfo"("userId");

-- CreateIndex
CREATE INDEX "logginInfo_userId_ipAddress_device_browser_os_location_idx" ON "logginInfo"("userId", "ipAddress", "device", "browser", "os", "location");

-- AddForeignKey
ALTER TABLE "allUsers" ADD CONSTRAINT "allUsers_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "logginInfo" ADD CONSTRAINT "logginInfo_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
