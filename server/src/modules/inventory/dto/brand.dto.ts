import { IsString, IsOptional, IsUUID, IsBoolean } from 'class-validator';

export class CreateBrandDto {

  @IsString()
  name: string;
}

export class UpdateBrandDto {

  @IsString()
  @IsOptional()
  name?: string;

  @IsBoolean()
  @IsOptional()
  isDeleted?: boolean;
}


