import { IsString, IsOptional, IsUUID, IsBoolean, IsNumber } from 'class-validator';


export class CreateStoreDto {

  @IsString()
  name: string;

  @IsString()
  location: string;

  @IsOptional()
  @IsNumber()
  ability?: number;
}

export class UpdateStoreDto {

  @IsString()
  @IsOptional()
  name?: string;

  @IsString()
  @IsOptional()
  location?: string;

  @IsOptional()
  @IsNumber()
  ability?: number;

  @IsBoolean()
  @IsOptional()
  isDeleted?: boolean;
}
