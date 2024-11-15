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
import { ProductService } from '../services/product.service';
import { CreateProductDto, UpdateProductDto } from '../dto/product.dto';
import { Product } from '@prisma/client';
import { ApiTags } from '@nestjs/swagger';

@Controller('Product')
@ApiTags('Product')
export class ProductController {
  constructor(private readonly ProductService: ProductService) {}

  @Post()
  async create(
    @Body() createProductDto: CreateProductDto,
  ): Promise<Product> {
    return this.ProductService.create(createProductDto);
  }

  @Get(':uuid')
  async findById(@Param('uuid') uuid: string): Promise<Product> {
    return this.ProductService.findById(uuid);
  }

  @Get()
  async findAll(
    @Query('skip') skip?: number,
    @Query('take') take?: number,
    @Query('cursor') cursor?: string,
    @Query('isDeleted') isDeleted?: boolean,
    @Query('orderBy') orderBy?: 'asc' | 'desc',
  ): Promise<Product[]> {
    return this.ProductService.findAllJoin({
      skip,
      take,
      cursor: cursor ? { uuid: cursor } : undefined,
      where: isDeleted !== undefined ? { isDeleted } : undefined,
      orderBy: orderBy ? { createdAt: orderBy } : undefined,
    });
  }

  @Put(':uuid')
  async update(
    @Param('uuid') uuid: string,
    @Body() updateProductDto: UpdateProductDto,
  ): Promise<Product> {
    return this.ProductService.update(uuid, updateProductDto);
  }

  @Delete(':uuid')
  @HttpCode(HttpStatus.NO_CONTENT)
  async delete(@Param('uuid') uuid: string): Promise<void> {
    await this.ProductService.delete(uuid);
  }
}
