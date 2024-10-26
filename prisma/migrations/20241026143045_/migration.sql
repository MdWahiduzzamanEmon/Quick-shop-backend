/*
  Warnings:

  - Added the required column `createdById` to the `product` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "product" ADD COLUMN     "createdById" TEXT NOT NULL,
ALTER COLUMN "isActive" SET DEFAULT 'ACTIVE';

-- AlterTable
ALTER TABLE "product_image" ALTER COLUMN "isActive" SET DEFAULT 'ACTIVE';

-- AddForeignKey
ALTER TABLE "product" ADD CONSTRAINT "product_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
