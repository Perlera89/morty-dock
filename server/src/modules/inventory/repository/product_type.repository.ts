import { Injectable } from '@nestjs/common';
import { PrismaService } from '../../../common/providers/prisma.service';
import { IProductTypeRepository } from '../interfaces/product_type.interface';
import { ProductType, Prisma } from '@prisma/client';

@Injectable()
export class ProductTypeRepository implements IProductTypeRepository {

  constructor(private readonly prisma: PrismaService) {}

  async create(data: Prisma.ProductTypeCreateInput): Promise<ProductType> {
    return await this.prisma.productType.create({ data });
  }

  async findById(uuid: string): Promise<ProductType | null> {
    return await this.prisma.productType.findUnique({
      where: { uuid },
    });
  }

  async findAll(params: {
    skip?: number;
    take?: number;
    cursor?: Prisma.ProductTypeWhereUniqueInput;
    where?: Prisma.ProductTypeWhereInput;
    orderBy?: Prisma.ProductTypeOrderByWithRelationInput;
  }): Promise<ProductType[]> {
    const { skip, take, cursor, where, orderBy } = params;
    return await this.prisma.productType.findMany({
      skip,
      take,
      cursor,
      where,
      orderBy,
    });
  }

  async update(
    uuid: string,
    data: Prisma.ProductTypeUpdateInput,
  ): Promise<ProductType> {
    return await this.prisma.productType.update({
      where: { uuid },
      data,
    });
  }

  async delete(uuid: string): Promise<ProductType> {
    return await this.prisma.productType.update({
      where: { uuid },
      data: { isDeleted: true },
    });
  }
}
