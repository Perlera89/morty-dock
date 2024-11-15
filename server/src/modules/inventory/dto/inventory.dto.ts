import {
  IsOptional,
  IsString,
  IsBoolean,
  IsDecimal,
  IsUUID,
  IsDate,
} from 'class-validator';
import { Transform, Type } from 'class-transformer';


export class CreateInventoryDto {

  @IsUUID()
  uuid: string;

  @IsOptional()
  @IsString()
  thumbnail?: string;

  @IsOptional()
  @IsDecimal()
  minimumStock?: string; // Utilizamos string para Decimal

  @IsOptional()
  @IsString()
  safetyInfo?: string;

  @IsOptional()
  @IsString()
  description?: string;

  /*@IsOptional()
  @Type(() => Date)
  @IsDate()
  @Transform(() => new Date())
  //@Transform(({ value }) => value ?? new Date()) // Asignar fecha actual si no se proporciona
  createdAt?: Date;*/

  /*@IsOptional()
  @Type(() => Date)
  @IsDate()
  @Transform(() => new Date())
  updatedAt?: Date;*/

  @IsOptional()
  @IsBoolean()
  isDeleted?: boolean;

  @IsOptional()
  @IsUUID()
  categoryId?: string;

  @IsOptional()
  @IsUUID()
  productTypeId?: string;

  @IsOptional()
  @IsUUID()
  areaId?: string;

  @IsOptional()
  @IsUUID()
  brandId?: string;

  @IsOptional()
  @IsUUID()
  storeId?: string;
}

export class UpdateInventoryDto {

  @IsOptional()
  @IsString()
  thumbnail?: string;

  @IsOptional()
  @IsDecimal()
  minimumStock?: string;

  @IsOptional()
  @IsString()
  safetyInfo?: string;

  @IsOptional()
  @IsString()
  description?: string;

  @IsOptional()
  @IsBoolean()
  isDeleted?: boolean;

  @IsOptional()
  @IsUUID()
  categoryId?: string;

  @IsOptional()
  @IsUUID()
  productTypeId?: string;

  @IsOptional()
  @IsUUID()
  areaId?: string;

  @IsOptional()
  @IsUUID()
  brandId?: string;

  @IsOptional()
  @IsUUID()
  storeId?: string;
}
