-- DropIndex
DROP INDEX "otherUsers_id_userId_role_isActive_idx";

-- AlterTable
ALTER TABLE "otherUsers" ADD COLUMN     "order" INTEGER NOT NULL DEFAULT 0,
ADD COLUMN     "userJoinDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "workers" ADD COLUMN     "userJoinDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- CreateIndex
CREATE INDEX "otherUsers_id_userId_role_isActive_userUniqueId_idx" ON "otherUsers"("id", "userId", "role", "isActive", "userUniqueId");
