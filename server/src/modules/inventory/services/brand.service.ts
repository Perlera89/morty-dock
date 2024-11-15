import { Injectable, NotFoundException } from '@nestjs/common';
import { BrandRepository } from '../repository/brand.repository';
import { CreateBrandDto, UpdateBrandDto } from '../dto/brand.dto';
import { Brand } from '@prisma/client';

@Injectable()
export class BrandService {
  constructor(private readonly brandRepository: BrandRepository) {}

  async create(createBrandDto: CreateBrandDto): Promise<Brand> {
    return this.brandRepository.create(createBrandDto);
  }

  async findById(uuid: string): Promise<Brand> {
    const Brand = await this.brandRepository.findById(uuid);
    if (!Brand) throw new NotFoundException(`Brand with UUID ${uuid} not found`);
    return Brand;
  }

  async findAll(params?: {
    skip?: number;
    take?: number;
    cursor?: { uuid: string }; 
    where?: { isDeleted?: boolean };
    orderBy?: { name?: 'asc' | 'desc' };
  }): Promise<Brand[]> {
    return this.brandRepository.findAll(params || {});
  }

  async update(uuid: string, updateBrandDto: UpdateBrandDto): Promise<Brand> {
    await this.findById(uuid);
    return this.brandRepository.update(uuid, updateBrandDto);
  }

  async delete(uuid: string): Promise<Brand> {
    await this.findById(uuid);
    return this.brandRepository.delete(uuid);
  }
}