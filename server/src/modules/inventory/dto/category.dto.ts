import { IsString, IsOptional, IsUUID, IsBoolean } from 'class-validator';


export class CreateCategoryDto {

  @IsString()
  name: string;
}

export class UpdateCategoryDto {

  @IsString()
  @IsOptional()
  name?: string;

  @IsBoolean()
  @IsOptional()
  isDeleted?: boolean;
}


