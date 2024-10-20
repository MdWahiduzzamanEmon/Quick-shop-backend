-- DropForeignKey
ALTER TABLE "investor_invest_project" DROP CONSTRAINT "investor_invest_project_investorId_fkey";

-- AddForeignKey
ALTER TABLE "investor_invest_project" ADD CONSTRAINT "investor_invest_project_investorId_fkey" FOREIGN KEY ("investorId") REFERENCES "investor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
