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
import { ProductTypeService } from '../services/product_type.service';
import { CreateProductTypeDto, UpdateProductTypeDto } from '../dto/product_type.dto';
import { ProductType } from '@prisma/client';
import { ApiTags } from '@nestjs/swagger';

@Controller('ProductType')
@ApiTags('ProductType')
export class ProductTypeController {
  constructor(private readonly _productTypeService: ProductTypeService) {}

  @Post()
  async create(@Body() createProductTypeDto: CreateProductTypeDto): Promise<ProductType> {
    return this._productTypeService.create(createProductTypeDto);
  }

  @Get(':uuid')
  async findById(@Param('uuid') uuid: string): Promise<ProductType> {
    return this._productTypeService.findById(uuid);
  }

  @Get()
  async findAll(
    @Query('skip') skip?: number,
    @Query('take') take?: number,
    @Query('cursor') cursor?: string,
    @Query('isDeleted') isDeleted?: boolean,
    @Query('orderBy') orderBy?: 'asc' | 'desc',
  ): Promise<ProductType[]> {
    return this._productTypeService.findAll({
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
    @Body() updateProductTypeDto: UpdateProductTypeDto,
  ): Promise<ProductType> {
    return this._productTypeService.update(uuid, updateProductTypeDto);
  }

  @Delete(':uuid')
  @HttpCode(HttpStatus.NO_CONTENT)
  async delete(@Param('uuid') uuid: string): Promise<void> {
    await this._productTypeService.delete(uuid);
  }
}
