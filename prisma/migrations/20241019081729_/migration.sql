-- DropForeignKey
ALTER TABLE "investor_invest_project" DROP CONSTRAINT "investor_invest_project_investorId_fkey";

-- DropForeignKey
ALTER TABLE "investor_invest_project" DROP CONSTRAINT "investor_invest_project_projectId_fkey";

-- AddForeignKey
ALTER TABLE "investor_invest_project" ADD CONSTRAINT "investor_invest_project_investorId_fkey" FOREIGN KEY ("investorId") REFERENCES "investor"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "investor_invest_project" ADD CONSTRAINT "investor_invest_project_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES "project"("id") ON DELETE CASCADE ON UPDATE CASCADE;
