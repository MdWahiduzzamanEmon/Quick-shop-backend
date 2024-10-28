/*
  Warnings:

  - You are about to drop the `District` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Division` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Union` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Upazila` table. If the table is not empty, all the data it contains will be lost.

*/
-- CreateEnum
CREATE TYPE "Zone_status" AS ENUM ('ACTIVE', 'INACTIVE');

-- DropForeignKey
ALTER TABLE "District" DROP CONSTRAINT "District_division_id_fkey";

-- DropForeignKey
ALTER TABLE "Union" DROP CONSTRAINT "Union_upazila_id_fkey";

-- DropForeignKey
ALTER TABLE "Upazila" DROP CONSTRAINT "Upazila_district_id_fkey";

-- DropForeignKey
ALTER TABLE "zone" DROP CONSTRAINT "zone_district_id_fkey";

-- DropForeignKey
ALTER TABLE "zone" DROP CONSTRAINT "zone_division_id_fkey";

-- DropForeignKey
ALTER TABLE "zone" DROP CONSTRAINT "zone_union_id_fkey";

-- DropForeignKey
ALTER TABLE "zone" DROP CONSTRAINT "zone_upazila_id_fkey";

-- AlterTable
ALTER TABLE "zone" ADD COLUMN     "isActive" "Zone_status" NOT NULL DEFAULT 'ACTIVE';

-- DropTable
DROP TABLE "District";

-- DropTable
DROP TABLE "Division";

-- DropTable
DROP TABLE "Union";

-- DropTable
DROP TABLE "Upazila";

-- CreateTable
CREATE TABLE "division" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "bn_name" TEXT NOT NULL,
    "url" TEXT NOT NULL,

    CONSTRAINT "division_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "district" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "bn_name" TEXT NOT NULL,
    "lat" DOUBLE PRECISION NOT NULL,
    "lon" DOUBLE PRECISION NOT NULL,
    "url" TEXT NOT NULL,
    "division_id" INTEGER NOT NULL,

    CONSTRAINT "district_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "upazila" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "bn_name" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "district_id" INTEGER NOT NULL,

    CONSTRAINT "upazila_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "union" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "bn_name" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "upazila_id" INTEGER NOT NULL,

    CONSTRAINT "union_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "district" ADD CONSTRAINT "district_division_id_fkey" FOREIGN KEY ("division_id") REFERENCES "division"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "upazila" ADD CONSTRAINT "upazila_district_id_fkey" FOREIGN KEY ("district_id") REFERENCES "district"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "union" ADD CONSTRAINT "union_upazila_id_fkey" FOREIGN KEY ("upazila_id") REFERENCES "upazila"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "zone" ADD CONSTRAINT "zone_division_id_fkey" FOREIGN KEY ("division_id") REFERENCES "division"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "zone" ADD CONSTRAINT "zone_district_id_fkey" FOREIGN KEY ("district_id") REFERENCES "district"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "zone" ADD CONSTRAINT "zone_upazila_id_fkey" FOREIGN KEY ("upazila_id") REFERENCES "upazila"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "zone" ADD CONSTRAINT "zone_union_id_fkey" FOREIGN KEY ("union_id") REFERENCES "union"("id") ON DELETE SET NULL ON UPDATE CASCADE;
