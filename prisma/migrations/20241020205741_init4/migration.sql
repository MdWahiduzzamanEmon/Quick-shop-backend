-- AlterTable
ALTER TABLE "logginInfo" ADD COLUMN     "administratorId" TEXT,
ADD COLUMN     "otherUsersId" TEXT;

-- AddForeignKey
ALTER TABLE "logginInfo" ADD CONSTRAINT "logginInfo_otherUsersId_fkey" FOREIGN KEY ("otherUsersId") REFERENCES "allUsers"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "logginInfo" ADD CONSTRAINT "logginInfo_administratorId_fkey" FOREIGN KEY ("administratorId") REFERENCES "adminastators"("id") ON DELETE SET NULL ON UPDATE CASCADE;
