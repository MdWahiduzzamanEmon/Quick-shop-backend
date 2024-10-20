-- DropIndex
DROP INDEX "logginInfo_userId_ipAddress_device_browser_os_location_idx";

-- DropIndex
DROP INDEX "logginInfo_userId_key";

-- CreateIndex
CREATE INDEX "logginInfo_userId_otherUsersId_status_idx" ON "logginInfo"("userId", "otherUsersId", "status");
