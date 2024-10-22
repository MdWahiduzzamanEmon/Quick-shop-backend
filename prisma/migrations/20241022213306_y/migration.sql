-- DropForeignKey
ALTER TABLE "allUsers" DROP CONSTRAINT "allUsers_userId_fkey";

-- DropForeignKey
ALTER TABLE "workers" DROP CONSTRAINT "workers_userId_fkey";

-- AddForeignKey
ALTER TABLE "allUsers" ADD CONSTRAINT "allUsers_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "workers" ADD CONSTRAINT "workers_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
