-- CreateEnum
CREATE TYPE "Role" AS ENUM ('ADMINISTRATOR', 'GENERAL_USER', 'RETAILER', 'SUPPLIER', 'RAIDER', 'OPERATOR', 'REPRESENTATIVE');

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "adminastators" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "mobile" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'ADMINISTRATOR',
    "isActive" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "adminastators_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "adminastators_userId_key" ON "adminastators"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "adminastators_email_key" ON "adminastators"("email");

-- CreateIndex
CREATE UNIQUE INDEX "adminastators_mobile_key" ON "adminastators"("mobile");

-- CreateIndex
CREATE INDEX "adminastators_userId_email_mobile_idx" ON "adminastators"("userId", "email", "mobile");

-- AddForeignKey
ALTER TABLE "adminastators" ADD CONSTRAINT "adminastators_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
