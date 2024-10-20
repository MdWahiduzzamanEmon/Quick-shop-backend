/*
  Warnings:

  - You are about to drop the column `investor_total_loss` on the `project_contact_info` table. All the data in the column will be lost.
  - You are about to drop the column `investor_total_profit` on the `project_contact_info` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "project" ADD COLUMN     "platform_profit" DOUBLE PRECISION DEFAULT 0,
ADD COLUMN     "profit_loss" DOUBLE PRECISION DEFAULT 0;

-- AlterTable
ALTER TABLE "project_contact_info" DROP COLUMN "investor_total_loss",
DROP COLUMN "investor_total_profit",
ADD COLUMN     "total_invested_amount" DOUBLE PRECISION NOT NULL DEFAULT 0;

-- CreateTable
CREATE TABLE "projectExpenses" (
    "id" SERIAL NOT NULL,
    "projectId" INTEGER NOT NULL,
    "expenseType" TEXT NOT NULL,
    "expenseAmount" DOUBLE PRECISION NOT NULL,
    "note" TEXT,
    "expenseDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "projectExpenses_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "projectExpenses" ADD CONSTRAINT "projectExpenses_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES "project"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
