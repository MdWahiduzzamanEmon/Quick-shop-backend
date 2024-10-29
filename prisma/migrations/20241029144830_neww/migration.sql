/*
  Warnings:

  - The primary key for the `zone` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- DropForeignKey
ALTER TABLE "_ZoneRepresentatives" DROP CONSTRAINT "_ZoneRepresentatives_A_fkey";

-- DropForeignKey
ALTER TABLE "_ZoneRiders" DROP CONSTRAINT "_ZoneRiders_A_fkey";

-- AlterTable
ALTER TABLE "_ZoneRepresentatives" ALTER COLUMN "A" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "_ZoneRiders" ALTER COLUMN "A" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "zone" DROP CONSTRAINT "zone_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "zone_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "zone_id_seq";

-- AddForeignKey
ALTER TABLE "_ZoneRepresentatives" ADD CONSTRAINT "_ZoneRepresentatives_A_fkey" FOREIGN KEY ("A") REFERENCES "zone"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ZoneRiders" ADD CONSTRAINT "_ZoneRiders_A_fkey" FOREIGN KEY ("A") REFERENCES "zone"("id") ON DELETE CASCADE ON UPDATE CASCADE;
