-- AlterTable
ALTER TABLE "product" ADD COLUMN     "product_mrp" DOUBLE PRECISION NOT NULL DEFAULT 0,
ADD COLUMN     "product_stock" INTEGER NOT NULL DEFAULT 0,
ADD COLUMN     "product_stock_limit" INTEGER NOT NULL DEFAULT 5,
ADD COLUMN     "product_total_sold" INTEGER NOT NULL DEFAULT 0;

-- CreateTable
CREATE TABLE "product_stock_purchase" (
    "id" TEXT NOT NULL,
    "purchase_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "supplierId" TEXT NOT NULL,
    "productId" TEXT NOT NULL,
    "purchaseUniqueId" TEXT NOT NULL,
    "product_quantity" INTEGER NOT NULL,
    "product_selling_price" DOUBLE PRECISION NOT NULL,
    "product_purchase_price" DOUBLE PRECISION NOT NULL,
    "product_retail_price" DOUBLE PRECISION NOT NULL,
    "product_old_mrp" DOUBLE PRECISION NOT NULL,
    "special_offer" TEXT,
    "zoneId" TEXT NOT NULL,
    "vendorId" TEXT NOT NULL,
    "createdById" TEXT NOT NULL,
    "isActive" "product_status" NOT NULL DEFAULT 'ACTIVE',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "product_stock_purchase_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "product_stock_report" (
    "id" TEXT NOT NULL,
    "product_stock_purchaseId" TEXT NOT NULL,
    "productId" TEXT NOT NULL,
    "product_stock" INTEGER NOT NULL DEFAULT 0,
    "product_selling_price" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "product_purchase_price" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "product_sold_quantity" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "isActive" "product_status" NOT NULL DEFAULT 'ACTIVE',

    CONSTRAINT "product_stock_report_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "product_stock_purchase_purchaseUniqueId_key" ON "product_stock_purchase"("purchaseUniqueId");

-- CreateIndex
CREATE INDEX "product_stock_purchase_id_purchase_date_supplierId_productI_idx" ON "product_stock_purchase"("id", "purchase_date", "supplierId", "productId", "zoneId", "vendorId", "createdById", "isActive", "purchaseUniqueId");

-- CreateIndex
CREATE INDEX "product_stock_report_id_product_stock_purchaseId_productId__idx" ON "product_stock_report"("id", "product_stock_purchaseId", "productId", "product_stock", "product_selling_price", "product_purchase_price", "product_sold_quantity", "isActive", "updatedAt", "createdAt");

-- AddForeignKey
ALTER TABLE "product_stock_purchase" ADD CONSTRAINT "product_stock_purchase_supplierId_fkey" FOREIGN KEY ("supplierId") REFERENCES "supplier"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_stock_purchase" ADD CONSTRAINT "product_stock_purchase_productId_fkey" FOREIGN KEY ("productId") REFERENCES "product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_stock_purchase" ADD CONSTRAINT "product_stock_purchase_zoneId_fkey" FOREIGN KEY ("zoneId") REFERENCES "zone"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_stock_purchase" ADD CONSTRAINT "product_stock_purchase_vendorId_fkey" FOREIGN KEY ("vendorId") REFERENCES "vendor"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_stock_purchase" ADD CONSTRAINT "product_stock_purchase_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_stock_report" ADD CONSTRAINT "product_stock_report_product_stock_purchaseId_fkey" FOREIGN KEY ("product_stock_purchaseId") REFERENCES "product_stock_purchase"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_stock_report" ADD CONSTRAINT "product_stock_report_productId_fkey" FOREIGN KEY ("productId") REFERENCES "product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
