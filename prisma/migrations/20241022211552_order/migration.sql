-- AlterTable
ALTER TABLE "workers" ADD COLUMN     "order" INTEGER NOT NULL DEFAULT 0,
ALTER COLUMN "education" SET DEFAULT ' ',
ALTER COLUMN "bankName" SET DEFAULT ' ',
ALTER COLUMN "branchName" SET DEFAULT ' ',
ALTER COLUMN "accountNumber" SET DEFAULT ' ',
ALTER COLUMN "mobileBanking" SET DEFAULT ' ',
ALTER COLUMN "mobileBankingNumber" SET DEFAULT ' ',
ALTER COLUMN "address" SET DEFAULT ' ',
ALTER COLUMN "zipCode" SET DEFAULT ' ';
