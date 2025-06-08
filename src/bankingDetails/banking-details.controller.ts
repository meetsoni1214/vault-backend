import { Body, Controller, Post, UseGuards, Request } from '@nestjs/common';
import { BankingDetailsService } from './banking-details.service';
import { JwtAuthGuard } from 'src/auth/guards/jwt-auth.guard';
import { CreateBankingDetailsDto } from './dto/create-banking-details.dto';

interface AuthenticatedRequest extends Request {
  user: {
    id: string;
    email: string;
    name: string;
  };
}

@Controller('banking-details')
export class BankingDetailsController {
  constructor(private readonly bankingDetailsService: BankingDetailsService) {}

  @UseGuards(JwtAuthGuard)
  @Post('create')
  createBankingDetails(
    @Body() createBankingDetailsDto: CreateBankingDetailsDto,
    @Request() req: AuthenticatedRequest,
  ) {
    return this.bankingDetailsService.createBankingDetails(
      createBankingDetailsDto,
      req.user.id,
    );
  }
}
