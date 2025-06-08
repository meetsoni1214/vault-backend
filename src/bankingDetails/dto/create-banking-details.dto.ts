export class CreateBankingDetailsDto {
  bankName: string;
  accountHolderName: string;
  accountType: string;
  accountNumber: string;
  ifscCode?: string;
  registeredMobileNumber?: string;
  registeredEmail?: string;
  remarks?: string;
  cardDetails?: CreateCardDetailsDto[];
  upiDetails?: CreateUpiDetailsDto[];
  mobileBankingDetails?: CreateMobileBankingDetailsDto[];
}

class CreateCardDetailsDto {
  nameOnCard: string;
  cardNumber: string;
  cardExpiryDate: string;
  cardCvv: string;
  cardPin: string;
  remarks?: string;
}

class CreateUpiDetailsDto {
  upiPin: string;
}

class CreateMobileBankingDetailsDto {
  loginPin: string;
  transactionPin: string;
  customFields?: CreateMobileBankingCustomFieldDto[];
}

class CreateMobileBankingCustomFieldDto {
  fieldName: string;
  fieldValue: string;
}
