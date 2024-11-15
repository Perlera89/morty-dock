import { IsOptional, IsString, IsBoolean, IsInt, IsDecimal, IsUUID, IsDate } from 'class-validator';
import { Type } from 'class-transformer';

export class CreateProductDto {

  @IsUUID()
  uuid: string;

  @IsOptional()
  @IsString()
  code?: string;

  @IsOptional()
  @IsInt()
  stock?: number;

  @IsOptional()
  @IsDecimal()
  purchasePrice?: string;

  @IsOptional()
  @IsDecimal()
  minimumPrice?: string;

  @IsOptional()
  @IsDecimal()
  salePrice?: string;

  @IsOptional()
  @IsDecimal()
  iva?: string;

  @IsOptional()
  @IsBoolean()
  isOnSale?: boolean;

  @IsOptional()
  @IsBoolean()
  isBlocked?: boolean;

  @IsOptional()
  @Type(() => Date)
  @IsDate()
  createdAt?: Date;

  @IsOptional()
  @Type(() => Date)
  @IsDate()
  updatedAt?: Date;

  @IsOptional()
  @IsBoolean()
  isDeleted?: boolean;

  @IsOptional()
  @IsUUID()
  inventoryId?: string;
}

export class UpdateProductDto {

  @IsOptional()
  @IsString()
  code?: string;

  @IsOptional()
  @IsInt()
  stock?: number;

  @IsOptional()
  @IsDecimal()
  purchasePrice?: string;

  @IsOptional()
  @IsDecimal()
  minimumPrice?: string;

  @IsOptional()
  @IsDecimal()
  salePrice?: string;

  @IsOptional()
  @IsDecimal()
  iva?: string;

  @IsOptional()
  @IsBoolean()
  isOnSale?: boolean;

  @IsOptional()
  @IsBoolean()
  isBlocked?: boolean;

  @IsOptional()
  @IsBoolean()
  isDeleted?: boolean;

  @IsOptional()
  @IsUUID()
  inventoryId?: string;
}
