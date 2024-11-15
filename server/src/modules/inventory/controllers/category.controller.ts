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
import { CategoryService } from '../services/category.service';
import { CreateCategoryDto, UpdateCategoryDto } from '../dto/category.dto';
import { Category } from '@prisma/client';
import { ApiTags } from '@nestjs/swagger';

@Controller('category')
@ApiTags('Category')
export class CategoryController {
  constructor(private readonly _categoryService: CategoryService) {}


  @Post()
  async create(@Body() createCategoryDto: CreateCategoryDto): Promise<Category> {
    return this._categoryService.create(createCategoryDto);
  }

  @Get(':uuid')
  async findById(@Param('uuid') uuid: string): Promise<Category> {
    return this._categoryService.findById(uuid);
  }

  @Get()
  async findAll(
    @Query('skip') skip?: number,
    @Query('take') take?: number,
    @Query('cursor') cursor?: string,
    @Query('isDeleted') isDeleted?: boolean,
    @Query('orderBy') orderBy?: 'asc' | 'desc',
  ): Promise<Category[]> {
    return this._categoryService.findAll({
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
    @Body() updateCategoryDto: UpdateCategoryDto,
  ): Promise<Category> {
    return this._categoryService.update(uuid, updateCategoryDto);
  }


  @Delete(':uuid')
  @HttpCode(HttpStatus.NO_CONTENT)
  async delete(@Param('uuid') uuid: string): Promise<void> {
    await this._categoryService.delete(uuid);
  }
}
