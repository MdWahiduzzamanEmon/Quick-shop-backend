/*
  Warnings:

  - The `isActive` column on the `admin` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `isActive` column on the `otherUsers` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `isActive` column on the `workers` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- CreateEnum
CREATE TYPE "User_status" AS ENUM ('ACTIVE', 'INACTIVE', 'PENDING', 'SUSPENDED', 'DELETED');

-- AlterTable
ALTER TABLE "admin" DROP COLUMN "isActive",
ADD COLUMN     "isActive" "User_status" NOT NULL DEFAULT 'ACTIVE';

-- AlterTable
ALTER TABLE "otherUsers" DROP COLUMN "isActive",
ADD COLUMN     "isActive" "User_status" NOT NULL DEFAULT 'ACTIVE';

-- AlterTable
ALTER TABLE "workers" DROP COLUMN "isActive",
ADD COLUMN     "isActive" "User_status" NOT NULL DEFAULT 'ACTIVE';

-- DropEnum
DROP TYPE "user_status";

-- CreateIndex
CREATE INDEX "admin_id_userId_role_isActive_idx" ON "admin"("id", "userId", "role", "isActive");

-- CreateIndex
CREATE INDEX "otherUsers_id_userId_role_isActive_userUniqueId_idx" ON "otherUsers"("id", "userId", "role", "isActive", "userUniqueId");

-- CreateIndex
CREATE INDEX "workers_id_userId_role_isActive_NID_employeeID_whatsapp_idx" ON "workers"("id", "userId", "role", "isActive", "NID", "employeeID", "whatsapp");
