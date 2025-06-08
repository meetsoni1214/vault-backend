import { Injectable } from '@nestjs/common';
import { CreateBankingDetailsDto } from './dto/create-banking-details.dto';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class BankingDetailsService {
  constructor(private readonly prisma: PrismaService) {}

  async createBankingDetails(
    createBankingDetailsDto: CreateBankingDetailsDto,
    userId: string,
  ) {
    const {
      bankName,
      accountHolderName,
      accountType,
      accountNumber,
      ifscCode,
      registeredMobileNumber,
      registeredEmail,
      remarks,
      cardDetails,
      upiDetails,
      mobileBankingDetails,
    } = createBankingDetailsDto;

    const bankingDetails = await this.prisma.bankingDetails.create({
      data: {
        bankName,
        accountHolderName,
        accountNumber,
        accountType,
        ifscCode,
        registeredMobileNumber,
        registeredEmail,
        remarks,
        cardDetails: cardDetails
          ? {
              create: cardDetails,
            }
          : undefined,
        upiDetails: upiDetails
          ? {
              create: upiDetails,
            }
          : undefined,
        mobileBankingDetails: mobileBankingDetails
          ? {
              create: mobileBankingDetails.map(({ customFields, ...rest }) => ({
                ...rest,
                customFields: customFields
                  ? {
                      create: customFields,
                    }
                  : undefined,
              })),
            }
          : undefined,
        userId,
      },
    });

    return bankingDetails;
  }
}
