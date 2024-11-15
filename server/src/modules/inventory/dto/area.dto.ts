import { IsString, IsOptional, IsUUID, IsBoolean } from 'class-validator';

export class CreateAreaDto {

  @IsString()
  name: string;
}

export class UpdateAreaDto {

  @IsString()
  @IsOptional()
  name?: string;

  @IsBoolean()
  @IsOptional()
  isDeleted?: boolean;
}


