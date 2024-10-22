-- DropForeignKey
ALTER TABLE "logginInfo" DROP CONSTRAINT "logginInfo_userId_fkey";

-- AddForeignKey
ALTER TABLE "logginInfo" ADD CONSTRAINT "logginInfo_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
