-- CreateTable
CREATE TABLE "BankingDetails" (
    "id" TEXT NOT NULL,
    "bankName" TEXT NOT NULL,
    "accountHolderName" TEXT NOT NULL,
    "accountType" TEXT NOT NULL,
    "accountNumber" TEXT NOT NULL,
    "ifscCode" TEXT,
    "registeredMobileNumber" TEXT,
    "registeredEmail" TEXT,
    "remarks" TEXT,
    "userId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BankingDetails_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CardDetails" (
    "id" TEXT NOT NULL,
    "nameOnCard" TEXT NOT NULL,
    "cardNumber" TEXT NOT NULL,
    "cardExpiryDate" TEXT NOT NULL,
    "cardCvv" TEXT NOT NULL,
    "cardPin" TEXT NOT NULL,
    "remarks" TEXT,
    "bankingDetailsId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CardDetails_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UpiDetails" (
    "id" TEXT NOT NULL,
    "upiPin" TEXT NOT NULL,
    "bankingDetailsId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "UpiDetails_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MobileBankingDetails" (
    "id" TEXT NOT NULL,
    "loginPin" TEXT NOT NULL,
    "transactionPin" TEXT NOT NULL,
    "bankingDetailsId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MobileBankingDetails_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MobileBankingCustomField" (
    "id" TEXT NOT NULL,
    "fieldName" TEXT NOT NULL,
    "fieldValue" TEXT NOT NULL,
    "mobileBankingDetailsId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MobileBankingCustomField_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "BankingDetails_userId_idx" ON "BankingDetails"("userId");

-- CreateIndex
CREATE INDEX "CardDetails_bankingDetailsId_idx" ON "CardDetails"("bankingDetailsId");

-- CreateIndex
CREATE INDEX "UpiDetails_bankingDetailsId_idx" ON "UpiDetails"("bankingDetailsId");

-- CreateIndex
CREATE INDEX "MobileBankingDetails_bankingDetailsId_idx" ON "MobileBankingDetails"("bankingDetailsId");

-- CreateIndex
CREATE INDEX "MobileBankingCustomField_mobileBankingDetailsId_idx" ON "MobileBankingCustomField"("mobileBankingDetailsId");

-- AddForeignKey
ALTER TABLE "BankingDetails" ADD CONSTRAINT "BankingDetails_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CardDetails" ADD CONSTRAINT "CardDetails_bankingDetailsId_fkey" FOREIGN KEY ("bankingDetailsId") REFERENCES "BankingDetails"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UpiDetails" ADD CONSTRAINT "UpiDetails_bankingDetailsId_fkey" FOREIGN KEY ("bankingDetailsId") REFERENCES "BankingDetails"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MobileBankingDetails" ADD CONSTRAINT "MobileBankingDetails_bankingDetailsId_fkey" FOREIGN KEY ("bankingDetailsId") REFERENCES "BankingDetails"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MobileBankingCustomField" ADD CONSTRAINT "MobileBankingCustomField_mobileBankingDetailsId_fkey" FOREIGN KEY ("mobileBankingDetailsId") REFERENCES "MobileBankingDetails"("id") ON DELETE CASCADE ON UPDATE CASCADE;
