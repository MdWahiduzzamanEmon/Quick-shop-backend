-- CreateEnum
CREATE TYPE "Role" AS ENUM ('ADMINISTRATOR', 'GENERAL_USER', 'RETAILER', 'SUPPLIER');

-- CreateEnum
CREATE TYPE "WorkerRole" AS ENUM ('RAIDER', 'OPERATOR', 'REPRESENTATIVE');

-- CreateEnum
CREATE TYPE "user_status" AS ENUM ('ACTIVE', 'INACTIVE', 'PENDING', 'SUSPENDED', 'DELETED');

-- CreateEnum
CREATE TYPE "loggin_status" AS ENUM ('SUCCESS', 'FAILED');

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

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
CREATE TABLE "workers" (
    "id" TEXT NOT NULL,
    "fullName" TEXT,
    "surname" TEXT NOT NULL,
    "role" "WorkerRole" NOT NULL DEFAULT 'OPERATOR',
    "fatherName" TEXT,
    "employeeID" TEXT,
    "whatsapp" TEXT,
    "mobile" TEXT NOT NULL,
    "NID" TEXT,
    "NIDImage" JSONB NOT NULL DEFAULT '{}',
    "education" TEXT DEFAULT 'N/A',
    "bankName" TEXT DEFAULT 'N/A',
    "branchName" TEXT DEFAULT 'N/A',
    "accountNumber" TEXT DEFAULT 'N/A',
    "mobileBanking" TEXT DEFAULT 'N/A',
    "mobileBankingNumber" TEXT DEFAULT 'N/A',
    "profileImage" JSONB NOT NULL DEFAULT '{}',
    "address" TEXT DEFAULT 'N/A',
    "zipCode" TEXT DEFAULT 'N/A',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "isActive" "user_status" NOT NULL DEFAULT 'ACTIVE',
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
    "otherUsersId" TEXT,

    CONSTRAINT "logginInfo_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "User_id_idx" ON "User"("id");

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
CREATE UNIQUE INDEX "workers_employeeID_key" ON "workers"("employeeID");

-- CreateIndex
CREATE UNIQUE INDEX "workers_whatsapp_key" ON "workers"("whatsapp");

-- CreateIndex
CREATE UNIQUE INDEX "workers_mobile_key" ON "workers"("mobile");

-- CreateIndex
CREATE UNIQUE INDEX "workers_NID_key" ON "workers"("NID");

-- CreateIndex
CREATE UNIQUE INDEX "workers_accountNumber_key" ON "workers"("accountNumber");

-- CreateIndex
CREATE UNIQUE INDEX "workers_mobileBankingNumber_key" ON "workers"("mobileBankingNumber");

-- CreateIndex
CREATE UNIQUE INDEX "workers_userId_key" ON "workers"("userId");

-- CreateIndex
CREATE INDEX "workers_id_employeeID_mobile_NID_accountNumber_mobileBankin_idx" ON "workers"("id", "employeeID", "mobile", "NID", "accountNumber", "mobileBankingNumber", "userId");

-- CreateIndex
CREATE INDEX "logginInfo_userId_otherUsersId_status_idx" ON "logginInfo"("userId", "otherUsersId", "status");

-- AddForeignKey
ALTER TABLE "allUsers" ADD CONSTRAINT "allUsers_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "workers" ADD CONSTRAINT "workers_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "logginInfo" ADD CONSTRAINT "logginInfo_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "logginInfo" ADD CONSTRAINT "logginInfo_otherUsersId_fkey" FOREIGN KEY ("otherUsersId") REFERENCES "allUsers"("id") ON DELETE SET NULL ON UPDATE CASCADE;
