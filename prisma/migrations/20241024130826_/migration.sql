-- CreateEnum
CREATE TYPE "Role" AS ENUM ('GENERAL_USER', 'RETAILER', 'SUPPLIER');

-- CreateEnum
CREATE TYPE "WorkerRole" AS ENUM ('RAIDER', 'OPERATOR', 'REPRESENTATIVE');

-- CreateEnum
CREATE TYPE "user_status" AS ENUM ('ACTIVE', 'INACTIVE', 'PENDING', 'SUSPENDED', 'DELETED');

-- CreateEnum
CREATE TYPE "loggin_status" AS ENUM ('SUCCESS', 'FAILED');

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "mobile" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "admin" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "fullName" TEXT,
    "role" TEXT NOT NULL DEFAULT 'ADMIN',
    "isActive" "user_status" NOT NULL DEFAULT 'ACTIVE',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "admin_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "otherUsers" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "firstName" TEXT,
    "lastName" TEXT,
    "profile_picture" JSONB NOT NULL DEFAULT '{}',
    "role" "Role" NOT NULL DEFAULT 'GENERAL_USER',
    "isActive" "user_status" NOT NULL DEFAULT 'ACTIVE',
    "userUniqueId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "otherUsers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "workers" (
    "id" TEXT NOT NULL,
    "fullName" TEXT,
    "role" "WorkerRole" NOT NULL DEFAULT 'OPERATOR',
    "fatherName" TEXT,
    "employeeID" TEXT,
    "whatsapp" TEXT,
    "NID" TEXT,
    "NIDImage" JSONB NOT NULL DEFAULT '{}',
    "education" TEXT DEFAULT '',
    "bankName" TEXT DEFAULT '',
    "branchName" TEXT DEFAULT '',
    "accountNumber" TEXT DEFAULT '',
    "mobileBanking" TEXT DEFAULT '',
    "mobileBankingNumber" TEXT DEFAULT '',
    "profile_picture" JSONB NOT NULL DEFAULT '{}',
    "address" TEXT DEFAULT '',
    "zipCode" TEXT DEFAULT '',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "isActive" "user_status" NOT NULL DEFAULT 'ACTIVE',
    "order" INTEGER NOT NULL DEFAULT 0,
    "userId" TEXT NOT NULL,

    CONSTRAINT "workers_pkey" PRIMARY KEY ("id")
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
    "note" TEXT,
    "loginAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "logginInfo_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "User_mobile_key" ON "User"("mobile");

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");

-- CreateIndex
CREATE INDEX "User_id_email_mobile_username_idx" ON "User"("id", "email", "mobile", "username");

-- CreateIndex
CREATE UNIQUE INDEX "admin_userId_key" ON "admin"("userId");

-- CreateIndex
CREATE INDEX "admin_id_userId_role_isActive_idx" ON "admin"("id", "userId", "role", "isActive");

-- CreateIndex
CREATE UNIQUE INDEX "otherUsers_userId_key" ON "otherUsers"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "otherUsers_userUniqueId_key" ON "otherUsers"("userUniqueId");

-- CreateIndex
CREATE INDEX "otherUsers_id_userId_role_isActive_idx" ON "otherUsers"("id", "userId", "role", "isActive");

-- CreateIndex
CREATE UNIQUE INDEX "workers_employeeID_key" ON "workers"("employeeID");

-- CreateIndex
CREATE UNIQUE INDEX "workers_whatsapp_key" ON "workers"("whatsapp");

-- CreateIndex
CREATE UNIQUE INDEX "workers_NID_key" ON "workers"("NID");

-- CreateIndex
CREATE UNIQUE INDEX "workers_userId_key" ON "workers"("userId");

-- CreateIndex
CREATE INDEX "workers_id_userId_role_isActive_NID_employeeID_whatsapp_idx" ON "workers"("id", "userId", "role", "isActive", "NID", "employeeID", "whatsapp");

-- CreateIndex
CREATE INDEX "logginInfo_userId_status_idx" ON "logginInfo"("userId", "status");

-- AddForeignKey
ALTER TABLE "admin" ADD CONSTRAINT "admin_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "otherUsers" ADD CONSTRAINT "otherUsers_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "workers" ADD CONSTRAINT "workers_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "logginInfo" ADD CONSTRAINT "logginInfo_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
