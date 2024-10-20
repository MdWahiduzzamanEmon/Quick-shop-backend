-- CreateEnum
CREATE TYPE "Role" AS ENUM ('INVESTOR', 'ADMIN');

-- CreateEnum
CREATE TYPE "DepositType" AS ENUM ('CASH', 'BANK');

-- CreateEnum
CREATE TYPE "WithdrawType" AS ENUM ('CASH', 'BANK');

-- CreateEnum
CREATE TYPE "TransactionType" AS ENUM ('DEPOSIT', 'WITHDRAW', 'INVEST');

-- CreateEnum
CREATE TYPE "Status" AS ENUM ('pending', 'approved', 'rejected', 'completed', 'sold_out', 'booked');

-- CreateEnum
CREATE TYPE "BUSINESS_MODEL" AS ENUM ('service_based', 'quantity_based', 'installment_based');

-- CreateEnum
CREATE TYPE "PROJECT_STATUS" AS ENUM ('draft', 'rejected', 'available', 'sold_out', 'booked', 'matured', 'completed');

-- CreateTable
CREATE TABLE "admin" (
    "id" SERIAL NOT NULL,
    "userName" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'ADMIN',
    "status" "Status" DEFAULT 'pending',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "admin_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "users" (
    "id" SERIAL NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "userName" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'INVESTOR',
    "status" "Status" DEFAULT 'pending',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "investor" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "availableBalance" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "totalDeposit" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "totalWithdraw" DOUBLE PRECISION NOT NULL DEFAULT 0,

    CONSTRAINT "investor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "deposit" (
    "id" SERIAL NOT NULL,
    "depositType" "DepositType" NOT NULL,
    "depositAmount" DOUBLE PRECISION NOT NULL,
    "depositDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "investorId" INTEGER NOT NULL,
    "note" TEXT,
    "status" "Status" DEFAULT 'pending',
    "accountHolderName" VARCHAR(255),
    "region" VARCHAR(255),
    "bankName" TEXT,
    "accountNumber" TEXT,
    "branchName" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deposit_transaction_id" TEXT NOT NULL,

    CONSTRAINT "deposit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "investor_bank_info" (
    "id" SERIAL NOT NULL,
    "investorId" INTEGER NOT NULL,
    "accountHolderName" VARCHAR(255) NOT NULL,
    "region" VARCHAR(255) NOT NULL,
    "bankName" TEXT NOT NULL,
    "accountNumber" TEXT NOT NULL,
    "branchName" TEXT NOT NULL,
    "status" "Status" NOT NULL DEFAULT 'pending',
    "nomineeName" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "investor_bank_info_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "withdraw" (
    "id" SERIAL NOT NULL,
    "withdrawalAmount" DOUBLE PRECISION NOT NULL,
    "investorId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "status" "Status" DEFAULT 'pending',
    "withdraw_transaction_id" TEXT NOT NULL,
    "note" TEXT,
    "withdrawType" "WithdrawType" NOT NULL,
    "withdrawDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "bankInfoId" INTEGER,

    CONSTRAINT "withdraw_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "transactionHistory" (
    "id" SERIAL NOT NULL,
    "transactionType" "TransactionType" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" "Status" DEFAULT 'pending',
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "investorId" INTEGER NOT NULL,
    "depositId" INTEGER,
    "withdrawId" INTEGER,
    "projectId" INTEGER,

    CONSTRAINT "transactionHistory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RegisterOtp" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "expireAt" TIMESTAMP(6) NOT NULL,
    "otp" VARCHAR(6) NOT NULL,
    "email" TEXT NOT NULL,
    "usingFor" VARCHAR(250),
    "status" "Status" DEFAULT 'pending',

    CONSTRAINT "RegisterOtp_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "project" (
    "id" SERIAL NOT NULL,
    "projectName" TEXT NOT NULL,
    "projectDescription" TEXT NOT NULL,
    "businessModel" "BUSINESS_MODEL" NOT NULL,
    "status" "PROJECT_STATUS" NOT NULL DEFAULT 'draft',
    "departmentId" INTEGER NOT NULL,
    "project_image" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "investment_start_date" TIMESTAMP(3) NOT NULL,
    "investment_end_date" TIMESTAMP(3) NOT NULL,
    "project_unique_id" TEXT,

    CONSTRAINT "project_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "investor_invest_project" (
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "investorId" INTEGER NOT NULL,
    "projectId" INTEGER NOT NULL,
    "investor_no_of_share" INTEGER NOT NULL DEFAULT 0,
    "investor_share_amount" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "investor_total_profit" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "investor_total_loss" DOUBLE PRECISION NOT NULL DEFAULT 0,

    CONSTRAINT "investor_invest_project_pkey" PRIMARY KEY ("investorId","projectId")
);

-- CreateTable
CREATE TABLE "project_contact_info" (
    "id" SERIAL NOT NULL,
    "hardware_asset_value" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "software_asset_value" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "brand_asset_value" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "property_asset_value" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "actual_project_value" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "owner_share_percentage" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "investor_share_percentage" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "owner_share_value" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "investor_share_value" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "owner_profit_loss_percent" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "investor_profit_loss_percent" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "owner_approximate_profit" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "investor_approximate_profit" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "no_of_share_required" INTEGER NOT NULL DEFAULT 0,
    "per_share_amount" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "contract_duration" INTEGER NOT NULL DEFAULT 0,
    "profit_loss_calc_month" INTEGER NOT NULL DEFAULT 0,
    "no_of_share_sold" INTEGER NOT NULL DEFAULT 0,
    "owner_total_profit" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "owner_total_loss" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "investor_total_profit" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "investor_total_loss" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "launch_date" TIMESTAMP(3),
    "mature_date" TIMESTAMP(3),
    "projectId" INTEGER NOT NULL,

    CONSTRAINT "project_contact_info_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "department" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "department_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_investorToproject" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "admin_userName_key" ON "admin"("userName");

-- CreateIndex
CREATE UNIQUE INDEX "admin_email_key" ON "admin"("email");

-- CreateIndex
CREATE UNIQUE INDEX "users_userName_key" ON "users"("userName");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "users_userName_email_key" ON "users"("userName", "email");

-- CreateIndex
CREATE UNIQUE INDEX "investor_userId_key" ON "investor"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "deposit_accountNumber_key" ON "deposit"("accountNumber");

-- CreateIndex
CREATE UNIQUE INDEX "deposit_deposit_transaction_id_key" ON "deposit"("deposit_transaction_id");

-- CreateIndex
CREATE UNIQUE INDEX "investor_bank_info_accountNumber_key" ON "investor_bank_info"("accountNumber");

-- CreateIndex
CREATE UNIQUE INDEX "withdraw_withdraw_transaction_id_key" ON "withdraw"("withdraw_transaction_id");

-- CreateIndex
CREATE UNIQUE INDEX "RegisterOtp_email_key" ON "RegisterOtp"("email");

-- CreateIndex
CREATE UNIQUE INDEX "project_project_unique_id_key" ON "project"("project_unique_id");

-- CreateIndex
CREATE UNIQUE INDEX "project_contact_info_projectId_key" ON "project_contact_info"("projectId");

-- CreateIndex
CREATE UNIQUE INDEX "department_name_key" ON "department"("name");

-- CreateIndex
CREATE UNIQUE INDEX "_investorToproject_AB_unique" ON "_investorToproject"("A", "B");

-- CreateIndex
CREATE INDEX "_investorToproject_B_index" ON "_investorToproject"("B");

-- AddForeignKey
ALTER TABLE "investor" ADD CONSTRAINT "investor_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "deposit" ADD CONSTRAINT "deposit_investorId_fkey" FOREIGN KEY ("investorId") REFERENCES "investor"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "investor_bank_info" ADD CONSTRAINT "investor_bank_info_investorId_fkey" FOREIGN KEY ("investorId") REFERENCES "investor"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "withdraw" ADD CONSTRAINT "withdraw_investorId_fkey" FOREIGN KEY ("investorId") REFERENCES "investor"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "withdraw" ADD CONSTRAINT "withdraw_bankInfoId_fkey" FOREIGN KEY ("bankInfoId") REFERENCES "investor_bank_info"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "transactionHistory" ADD CONSTRAINT "transactionHistory_investorId_fkey" FOREIGN KEY ("investorId") REFERENCES "investor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "transactionHistory" ADD CONSTRAINT "transactionHistory_depositId_fkey" FOREIGN KEY ("depositId") REFERENCES "deposit"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "transactionHistory" ADD CONSTRAINT "transactionHistory_withdrawId_fkey" FOREIGN KEY ("withdrawId") REFERENCES "withdraw"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "transactionHistory" ADD CONSTRAINT "transactionHistory_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES "project"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "project" ADD CONSTRAINT "project_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "department"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "investor_invest_project" ADD CONSTRAINT "investor_invest_project_investorId_fkey" FOREIGN KEY ("investorId") REFERENCES "investor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "investor_invest_project" ADD CONSTRAINT "investor_invest_project_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES "project"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "project_contact_info" ADD CONSTRAINT "project_contact_info_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES "project"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_investorToproject" ADD CONSTRAINT "_investorToproject_A_fkey" FOREIGN KEY ("A") REFERENCES "investor"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_investorToproject" ADD CONSTRAINT "_investorToproject_B_fkey" FOREIGN KEY ("B") REFERENCES "project"("id") ON DELETE CASCADE ON UPDATE CASCADE;
