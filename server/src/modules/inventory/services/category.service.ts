import { Injectable, NotFoundException } from '@nestjs/common';
import { CategoryRepository } from '../repository/category.repository';
import { CreateCategoryDto, UpdateCategoryDto } from '../dto/category.dto';
import { Category } from '@prisma/client';

@Injectable()
export class CategoryService {
  constructor(private readonly _categoryRepository: CategoryRepository) {}

  async create(createCategoryDto: CreateCategoryDto): Promise<Category> {
    return this._categoryRepository.create(createCategoryDto);
  }

  async findById(uuid: string): Promise<Category> {
    const Category = await this._categoryRepository.findById(uuid);
    if (!Category) throw new NotFoundException(`Category with UUID ${uuid} not found`);
    return Category;
  }

  async findAll(params?: {
    skip?: number; 
    take?: number; 
    cursor?: { uuid: string }; 
    where?: { isDeleted?: boolean }; 
    orderBy?: { name?: 'asc' | 'desc' };
  }): Promise<Category[]> {
    return this._categoryRepository.findAll(params || {});
  }

  async update(uuid: string, updateCategoryDto: UpdateCategoryDto): Promise<Category> {
    await this.findById(uuid); 
    return this._categoryRepository.update(uuid, updateCategoryDto);
  }

  async delete(uuid: string): Promise<Category> {
    await this.findById(uuid);
    return this._categoryRepository.delete(uuid);
  }
}