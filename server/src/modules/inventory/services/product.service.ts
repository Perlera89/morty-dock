import { Injectable, NotFoundException } from '@nestjs/common';
import { ProductRepository } from '../repository/product.repository';
import { DateTime } from 'luxon';
import { CreateProductDto, UpdateProductDto } from '../dto/product.dto';
import { Product } from '@prisma/client';

@Injectable()
export class ProductService {
  constructor(private readonly ProductRepository: ProductRepository) {}

  async create(createProductDto: CreateProductDto): Promise<Product> {
    const createdAt = DateTime.now()
      .setZone('America/El_Salvador')
      .toFormat("yyyy-MM-dd'T'HH:mm'Z'");

    const createdAtDate = new Date(createdAt);

    const ProductData = {
      code: createProductDto.code,
      stock: createProductDto.stock,
      purchasePrice: createProductDto.purchasePrice,
      minimumPrice: createProductDto.minimumPrice,
      salePrice: createProductDto.salePrice,
      iva: createProductDto.iva,
      isOnSale: createProductDto.isOnSale,
      isBlocked: createProductDto.isBlocked,
      createdAt: createdAtDate,
      updatedAt: null,
      inventoryId: createProductDto.inventoryId,
    };

    return this.ProductRepository.create(ProductData);
  }

  async findById(uuid: string): Promise<Product> {
    const Product = await this.ProductRepository.findById(uuid);
    if (!Product)
      throw new NotFoundException(`Product with UUID ${uuid} not found`);
    return Product;
  }

  async findAllJoin(params?: {
    skip?: number;
    take?: number;
    cursor?: { uuid: string };
    where?: { isDeleted?: boolean };
    orderBy?: { createdAt?: 'asc' | 'desc' };
  }): Promise<Product[]> {
    return this.ProductRepository.findAllJoin(params || {});
  }

  async update(
    uuid: string,
    updateProductDto: UpdateProductDto,
  ): Promise<Product> {
    await this.findById(uuid);
    return this.ProductRepository.update(uuid, updateProductDto);
  }

  async delete(uuid: string): Promise<Product> {
    await this.findById(uuid);
    return this.ProductRepository.delete(uuid);
  }
}
