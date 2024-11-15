import { Injectable, NotFoundException } from '@nestjs/common';
import { ProductTypeRepository } from '../repository/product_type.repository';
import { CreateProductTypeDto, UpdateProductTypeDto } from '../dto/product_type.dto';
import { ProductType } from '@prisma/client';

@Injectable()
export class ProductTypeService {
  constructor(private readonly _productTypeRepository: ProductTypeRepository) {}

  async create(createProductTypeDto: CreateProductTypeDto): Promise<ProductType> {
    return this._productTypeRepository.create(createProductTypeDto);
  }

  async findById(uuid: string): Promise<ProductType> {
    const ProductType = await this._productTypeRepository.findById(uuid);
    if (!ProductType) throw new NotFoundException(`ProductType with UUID ${uuid} not found`);
    return ProductType;
  }

  async findAll(params?: {
    skip?: number; 
    take?: number; 
    cursor?: { uuid: string };
    where?: { isDeleted?: boolean }; 
    orderBy?: { name?: 'asc' | 'desc' }; 
  }): Promise<ProductType[]> {
    return this._productTypeRepository.findAll(params || {});
  }

  async update(uuid: string, updateProductTypeDto: UpdateProductTypeDto): Promise<ProductType> {
    await this.findById(uuid); 
    return this._productTypeRepository.update(uuid, updateProductTypeDto);
  }

  async delete(uuid: string): Promise<ProductType> {
    await this.findById(uuid);
    return this._productTypeRepository.delete(uuid);
  }
}