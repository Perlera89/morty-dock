import { IsString, IsOptional, IsUUID, IsBoolean } from 'class-validator';

export class CreateProductTypeDto {

  @IsString()
  name: string;
}

export class UpdateProductTypeDto {

  @IsString()
  @IsOptional()
  name?: string;

  @IsBoolean()
  @IsOptional()
  isDeleted?: boolean;
}


