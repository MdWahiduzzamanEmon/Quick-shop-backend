-- CreateEnum
CREATE TYPE "Role" AS ENUM ('GENERAL_USER', 'RETAILER');

-- CreateEnum
CREATE TYPE "WorkerRole" AS ENUM ('RAIDER', 'OPERATOR', 'REPRESENTATIVE');

-- CreateEnum
CREATE TYPE "User_status" AS ENUM ('ACTIVE', 'INACTIVE', 'PENDING', 'SUSPENDED', 'DELETED');

-- CreateEnum
CREATE TYPE "ShopStatus" AS ENUM ('ACTIVE', 'INACTIVE');

-- CreateEnum
CREATE TYPE "loggin_status" AS ENUM ('SUCCESS', 'FAILED');

-- CreateEnum
CREATE TYPE "product_status" AS ENUM ('ACTIVE', 'INACTIVE', 'PENDING', 'SUSPENDED', 'DELETED');

-- CreateEnum
CREATE TYPE "product_quantity_type" AS ENUM ('UNIT', 'PIECE', 'KG', 'GRAM', 'PER', 'DOZEN', 'BOX', 'CASE', 'FEET', 'LITER', 'SET');

-- CreateEnum
CREATE TYPE "delivery_charge_type" AS ENUM ('FIXED', 'REGULAR', 'FREE', 'CHARGEABLE');

-- CreateTable
CREATE TABLE "vendor" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "phone" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "isActive" "ShopStatus" NOT NULL DEFAULT 'ACTIVE',

    CONSTRAINT "vendor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "mobile" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "vendorId" TEXT NOT NULL,

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "admin" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "fullName" TEXT,
    "role" TEXT NOT NULL DEFAULT 'ADMIN',
    "isActive" "User_status" NOT NULL DEFAULT 'ACTIVE',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "admin_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "supplier" (
    "id" TEXT NOT NULL,
    "fullName" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "whatsapp" TEXT NOT NULL,
    "profile_picture" JSONB NOT NULL DEFAULT '{}',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "isActive" "User_status" NOT NULL DEFAULT 'ACTIVE',
    "userId" TEXT NOT NULL,
    "role" TEXT NOT NULL DEFAULT 'SUPPLIER',

    CONSTRAINT "supplier_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "otherUsers" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "firstName" TEXT,
    "lastName" TEXT,
    "profile_picture" JSONB NOT NULL DEFAULT '{}',
    "role" "Role" NOT NULL DEFAULT 'GENERAL_USER',
    "isActive" "User_status" NOT NULL DEFAULT 'ACTIVE',
    "userUniqueId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "order" INTEGER NOT NULL DEFAULT 0,
    "userJoinDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

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
    "userJoinDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "isActive" "User_status" NOT NULL DEFAULT 'ACTIVE',
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

-- CreateTable
CREATE TABLE "product_category" (
    "id" TEXT NOT NULL,
    "product_category_name" TEXT NOT NULL,
    "description" TEXT,
    "image" JSONB NOT NULL DEFAULT '{}',
    "isActive" "product_status" NOT NULL DEFAULT 'PENDING',
    "order" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "vendorId" TEXT NOT NULL,
    "createdById" TEXT NOT NULL,

    CONSTRAINT "product_category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "product" (
    "id" TEXT NOT NULL,
    "product_name" TEXT NOT NULL,
    "description" TEXT,
    "product_quantity_type" "product_quantity_type" NOT NULL,
    "delivery_charge_type" "delivery_charge_type" NOT NULL,
    "isActive" "product_status" NOT NULL DEFAULT 'ACTIVE',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "vendorId" TEXT NOT NULL,
    "categoryId" TEXT NOT NULL,
    "createdById" TEXT NOT NULL,

    CONSTRAINT "product_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "product_image" (
    "id" TEXT NOT NULL,
    "image" JSONB NOT NULL DEFAULT '{}',
    "isActive" "product_status" NOT NULL DEFAULT 'ACTIVE',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "productId" TEXT NOT NULL,

    CONSTRAINT "product_image_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "vendor_name_key" ON "vendor"("name");

-- CreateIndex
CREATE UNIQUE INDEX "vendor_phone_key" ON "vendor"("phone");

-- CreateIndex
CREATE INDEX "vendor_id_isActive_name_idx" ON "vendor"("id", "isActive", "name");

-- CreateIndex
CREATE UNIQUE INDEX "user_email_key" ON "user"("email");

-- CreateIndex
CREATE UNIQUE INDEX "user_mobile_key" ON "user"("mobile");

-- CreateIndex
CREATE UNIQUE INDEX "user_username_key" ON "user"("username");

-- CreateIndex
CREATE INDEX "user_id_email_mobile_username_idx" ON "user"("id", "email", "mobile", "username");

-- CreateIndex
CREATE UNIQUE INDEX "user_email_mobile_username_key" ON "user"("email", "mobile", "username");

-- CreateIndex
CREATE UNIQUE INDEX "admin_userId_key" ON "admin"("userId");

-- CreateIndex
CREATE INDEX "admin_id_userId_role_isActive_idx" ON "admin"("id", "userId", "role", "isActive");

-- CreateIndex
CREATE UNIQUE INDEX "supplier_userId_key" ON "supplier"("userId");

-- CreateIndex
CREATE INDEX "supplier_id_userId_isActive_idx" ON "supplier"("id", "userId", "isActive");

-- CreateIndex
CREATE UNIQUE INDEX "otherUsers_userId_key" ON "otherUsers"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "otherUsers_userUniqueId_key" ON "otherUsers"("userUniqueId");

-- CreateIndex
CREATE INDEX "otherUsers_id_userId_role_isActive_userUniqueId_idx" ON "otherUsers"("id", "userId", "role", "isActive", "userUniqueId");

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

-- CreateIndex
CREATE INDEX "product_category_id_product_category_name_isActive_idx" ON "product_category"("id", "product_category_name", "isActive");

-- CreateIndex
CREATE INDEX "product_id_product_name_isActive_idx" ON "product"("id", "product_name", "isActive");

-- CreateIndex
CREATE INDEX "product_image_id_isActive_idx" ON "product_image"("id", "isActive");

-- AddForeignKey
ALTER TABLE "user" ADD CONSTRAINT "user_vendorId_fkey" FOREIGN KEY ("vendorId") REFERENCES "vendor"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "admin" ADD CONSTRAINT "admin_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "supplier" ADD CONSTRAINT "supplier_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "otherUsers" ADD CONSTRAINT "otherUsers_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "workers" ADD CONSTRAINT "workers_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "logginInfo" ADD CONSTRAINT "logginInfo_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_category" ADD CONSTRAINT "product_category_vendorId_fkey" FOREIGN KEY ("vendorId") REFERENCES "vendor"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_category" ADD CONSTRAINT "product_category_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product" ADD CONSTRAINT "product_vendorId_fkey" FOREIGN KEY ("vendorId") REFERENCES "vendor"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product" ADD CONSTRAINT "product_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "product_category"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product" ADD CONSTRAINT "product_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_image" ADD CONSTRAINT "product_image_productId_fkey" FOREIGN KEY ("productId") REFERENCES "product"("id") ON DELETE CASCADE ON UPDATE CASCADE;
