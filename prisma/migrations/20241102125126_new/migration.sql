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

-- CreateEnum
CREATE TYPE "Zone_status" AS ENUM ('ACTIVE', 'INACTIVE');

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

-- CreateTable
CREATE TABLE "vendor" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "phone" TEXT,
    "vendor_image" JSONB DEFAULT '{}',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "isActive" "ShopStatus" NOT NULL DEFAULT 'ACTIVE',
    "superAdminId" TEXT NOT NULL,

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
    "role" TEXT NOT NULL DEFAULT 'ADMIN',
    "isActive" "User_status" NOT NULL DEFAULT 'ACTIVE',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "admin_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "supplier" (
    "id" TEXT NOT NULL,
    "supplierName" TEXT NOT NULL,
    "srName" TEXT,
    "dealerName" TEXT NOT NULL,
    "srContactNo" TEXT NOT NULL,
    "srWhatsappNo" TEXT NOT NULL,
    "dealerContactNo" TEXT NOT NULL,
    "dealerEmail" TEXT NOT NULL,
    "dealerAddress" TEXT NOT NULL,
    "supplierUniqueId" TEXT NOT NULL,
    "companyLogo" JSONB NOT NULL DEFAULT '{}',
    "srPhoto" JSONB NOT NULL DEFAULT '{}',
    "isActive" "User_status" NOT NULL DEFAULT 'ACTIVE',
    "role" TEXT NOT NULL DEFAULT 'SUPPLIER',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

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
    "product_code" TEXT NOT NULL,
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

-- CreateTable
CREATE TABLE "division" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "bn_name" TEXT NOT NULL,
    "url" TEXT NOT NULL,

    CONSTRAINT "division_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "district" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "bn_name" TEXT NOT NULL,
    "lat" DOUBLE PRECISION NOT NULL,
    "lon" DOUBLE PRECISION NOT NULL,
    "url" TEXT NOT NULL,
    "division_id" INTEGER NOT NULL,

    CONSTRAINT "district_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "upazila" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "bn_name" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "district_id" INTEGER NOT NULL,

    CONSTRAINT "upazila_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "union" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "bn_name" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "upazila_id" INTEGER NOT NULL,

    CONSTRAINT "union_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "zone" (
    "id" TEXT NOT NULL,
    "village_name" TEXT NOT NULL,
    "ward_no" TEXT NOT NULL,
    "zone_name" TEXT NOT NULL,
    "contact_no" TEXT,
    "whatsapp_no" TEXT,
    "isActive" "Zone_status" NOT NULL DEFAULT 'ACTIVE',
    "division_id" INTEGER,
    "district_id" INTEGER,
    "upazila_id" INTEGER,
    "union_id" INTEGER,
    "operatorId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdById" TEXT NOT NULL,
    "vendorId" TEXT NOT NULL,

    CONSTRAINT "zone_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_SupplierToVendor" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_ZoneRepresentatives" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_ZoneRiders" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
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
CREATE UNIQUE INDEX "vendor_name_key" ON "vendor"("name");

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
CREATE INDEX "admin_id_role_isActive_idx" ON "admin"("id", "role", "isActive");

-- CreateIndex
CREATE UNIQUE INDEX "supplier_supplierName_key" ON "supplier"("supplierName");

-- CreateIndex
CREATE UNIQUE INDEX "supplier_srContactNo_key" ON "supplier"("srContactNo");

-- CreateIndex
CREATE UNIQUE INDEX "supplier_dealerContactNo_key" ON "supplier"("dealerContactNo");

-- CreateIndex
CREATE UNIQUE INDEX "supplier_dealerEmail_key" ON "supplier"("dealerEmail");

-- CreateIndex
CREATE UNIQUE INDEX "supplier_supplierUniqueId_key" ON "supplier"("supplierUniqueId");

-- CreateIndex
CREATE INDEX "supplier_id_role_isActive_supplierUniqueId_srContactNo_deal_idx" ON "supplier"("id", "role", "isActive", "supplierUniqueId", "srContactNo", "dealerContactNo", "dealerEmail", "supplierName");

-- CreateIndex
CREATE UNIQUE INDEX "supplier_srContactNo_dealerContactNo_dealerEmail_supplierUn_key" ON "supplier"("srContactNo", "dealerContactNo", "dealerEmail", "supplierUniqueId", "supplierName");

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
CREATE UNIQUE INDEX "product_product_code_key" ON "product"("product_code");

-- CreateIndex
CREATE INDEX "product_id_product_name_isActive_idx" ON "product"("id", "product_name", "isActive");

-- CreateIndex
CREATE INDEX "product_image_id_isActive_idx" ON "product_image"("id", "isActive");

-- CreateIndex
CREATE UNIQUE INDEX "zone_operatorId_key" ON "zone"("operatorId");

-- CreateIndex
CREATE INDEX "zone_id_isActive_division_id_district_id_upazila_id_union_i_idx" ON "zone"("id", "isActive", "division_id", "district_id", "upazila_id", "union_id", "operatorId", "vendorId");

-- CreateIndex
CREATE UNIQUE INDEX "_SupplierToVendor_AB_unique" ON "_SupplierToVendor"("A", "B");

-- CreateIndex
CREATE INDEX "_SupplierToVendor_B_index" ON "_SupplierToVendor"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ZoneRepresentatives_AB_unique" ON "_ZoneRepresentatives"("A", "B");

-- CreateIndex
CREATE INDEX "_ZoneRepresentatives_B_index" ON "_ZoneRepresentatives"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ZoneRiders_AB_unique" ON "_ZoneRiders"("A", "B");

-- CreateIndex
CREATE INDEX "_ZoneRiders_B_index" ON "_ZoneRiders"("B");

-- AddForeignKey
ALTER TABLE "vendor" ADD CONSTRAINT "vendor_superAdminId_fkey" FOREIGN KEY ("superAdminId") REFERENCES "superAdmin"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user" ADD CONSTRAINT "user_vendorId_fkey" FOREIGN KEY ("vendorId") REFERENCES "vendor"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "admin" ADD CONSTRAINT "admin_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

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

-- AddForeignKey
ALTER TABLE "district" ADD CONSTRAINT "district_division_id_fkey" FOREIGN KEY ("division_id") REFERENCES "division"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "upazila" ADD CONSTRAINT "upazila_district_id_fkey" FOREIGN KEY ("district_id") REFERENCES "district"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "union" ADD CONSTRAINT "union_upazila_id_fkey" FOREIGN KEY ("upazila_id") REFERENCES "upazila"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "zone" ADD CONSTRAINT "zone_division_id_fkey" FOREIGN KEY ("division_id") REFERENCES "division"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "zone" ADD CONSTRAINT "zone_district_id_fkey" FOREIGN KEY ("district_id") REFERENCES "district"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "zone" ADD CONSTRAINT "zone_upazila_id_fkey" FOREIGN KEY ("upazila_id") REFERENCES "upazila"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "zone" ADD CONSTRAINT "zone_union_id_fkey" FOREIGN KEY ("union_id") REFERENCES "union"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "zone" ADD CONSTRAINT "zone_operatorId_fkey" FOREIGN KEY ("operatorId") REFERENCES "workers"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "zone" ADD CONSTRAINT "zone_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "zone" ADD CONSTRAINT "zone_vendorId_fkey" FOREIGN KEY ("vendorId") REFERENCES "vendor"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_SupplierToVendor" ADD CONSTRAINT "_SupplierToVendor_A_fkey" FOREIGN KEY ("A") REFERENCES "supplier"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_SupplierToVendor" ADD CONSTRAINT "_SupplierToVendor_B_fkey" FOREIGN KEY ("B") REFERENCES "vendor"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ZoneRepresentatives" ADD CONSTRAINT "_ZoneRepresentatives_A_fkey" FOREIGN KEY ("A") REFERENCES "zone"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ZoneRepresentatives" ADD CONSTRAINT "_ZoneRepresentatives_B_fkey" FOREIGN KEY ("B") REFERENCES "workers"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ZoneRiders" ADD CONSTRAINT "_ZoneRiders_A_fkey" FOREIGN KEY ("A") REFERENCES "zone"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ZoneRiders" ADD CONSTRAINT "_ZoneRiders_B_fkey" FOREIGN KEY ("B") REFERENCES "workers"("id") ON DELETE CASCADE ON UPDATE CASCADE;
