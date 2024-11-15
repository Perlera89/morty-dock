import {
  Controller,
  Get,
  Post,
  Patch,
  Delete,
  Param,
  Body,
  Query,
  HttpCode,
  HttpStatus,
  Put,
} from '@nestjs/common';
import { BrandService } from '../services/brand.service';
import { CreateBrandDto, UpdateBrandDto } from '../dto/brand.dto';
import { Brand } from '@prisma/client';
import { ApiTags } from '@nestjs/swagger';

@Controller('brand')
@ApiTags('Brand')
export class BrandController {
  constructor(private readonly _brandService: BrandService) {}

  @Post()
  async create(@Body() createBrandDto: CreateBrandDto): Promise<Brand> {
    return this._brandService.create(createBrandDto);
  }

  @Get(':uuid')
  async findById(@Param('uuid') uuid: string): Promise<Brand> {
    return this._brandService.findById(uuid);
  }

  @Get()
  async findAll(
    @Query('skip') skip?: number,
    @Query('take') take?: number,
    @Query('cursor') cursor?: string,
    @Query('isDeleted') isDeleted?: boolean,
    @Query('orderBy') orderBy?: 'asc' | 'desc',
  ): Promise<Brand[]> {
    return this._brandService.findAll({
      skip,
      take,
      cursor: cursor ? { uuid: cursor } : undefined,
      where: isDeleted !== undefined ? { isDeleted } : undefined,
      orderBy: orderBy ? { name: orderBy } : undefined,
    });
  }

  @Put(':uuid')
  async update(
    @Param('uuid') uuid: string,
    @Body() updateBrandDto: UpdateBrandDto,
  ): Promise<Brand> {
    return this._brandService.update(uuid, updateBrandDto);
  }

  @Delete(':uuid')
  @HttpCode(HttpStatus.NO_CONTENT)
  async delete(@Param('uuid') uuid: string): Promise<void> {
    await this._brandService.delete(uuid);
  }
}
