-- CreateTable
CREATE TABLE "zone" (
    "id" SERIAL NOT NULL,
    "village_name" TEXT NOT NULL,
    "ward_no" TEXT NOT NULL,
    "zone_name" TEXT NOT NULL,
    "contact_no" TEXT,
    "whatsapp_no" TEXT,
    "division_id" INTEGER,
    "district_id" INTEGER,
    "upazila_id" INTEGER,
    "union_id" INTEGER,
    "operatorId" TEXT,

    CONSTRAINT "zone_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_ZoneRepresentatives" (
    "A" INTEGER NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_ZoneRiders" (
    "A" INTEGER NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "zone_operatorId_key" ON "zone"("operatorId");

-- CreateIndex
CREATE UNIQUE INDEX "_ZoneRepresentatives_AB_unique" ON "_ZoneRepresentatives"("A", "B");

-- CreateIndex
CREATE INDEX "_ZoneRepresentatives_B_index" ON "_ZoneRepresentatives"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ZoneRiders_AB_unique" ON "_ZoneRiders"("A", "B");

-- CreateIndex
CREATE INDEX "_ZoneRiders_B_index" ON "_ZoneRiders"("B");

-- AddForeignKey
ALTER TABLE "zone" ADD CONSTRAINT "zone_division_id_fkey" FOREIGN KEY ("division_id") REFERENCES "Division"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "zone" ADD CONSTRAINT "zone_district_id_fkey" FOREIGN KEY ("district_id") REFERENCES "District"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "zone" ADD CONSTRAINT "zone_upazila_id_fkey" FOREIGN KEY ("upazila_id") REFERENCES "Upazila"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "zone" ADD CONSTRAINT "zone_union_id_fkey" FOREIGN KEY ("union_id") REFERENCES "Union"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "zone" ADD CONSTRAINT "zone_operatorId_fkey" FOREIGN KEY ("operatorId") REFERENCES "workers"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ZoneRepresentatives" ADD CONSTRAINT "_ZoneRepresentatives_A_fkey" FOREIGN KEY ("A") REFERENCES "zone"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ZoneRepresentatives" ADD CONSTRAINT "_ZoneRepresentatives_B_fkey" FOREIGN KEY ("B") REFERENCES "workers"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ZoneRiders" ADD CONSTRAINT "_ZoneRiders_A_fkey" FOREIGN KEY ("A") REFERENCES "zone"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ZoneRiders" ADD CONSTRAINT "_ZoneRiders_B_fkey" FOREIGN KEY ("B") REFERENCES "workers"("id") ON DELETE CASCADE ON UPDATE CASCADE;
