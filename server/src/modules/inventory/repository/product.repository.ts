import { Injectable } from '@nestjs/common';
import { PrismaService } from '../../../common/providers/prisma.service';
import { IProductRepository } from '../interfaces/product.interface';
import { Product, Prisma } from '@prisma/client';

@Injectable()
export class ProductRepository implements IProductRepository {
  constructor(private readonly prisma: PrismaService) {}

  async create(data: Prisma.ProductCreateInput): Promise<Product> {
    return await this.prisma.product.create({ data });
  }

  async findById(uuid: string): Promise<Product | null> {
    return await this.prisma.product.findUnique({
      where: { uuid },
    });
  }

  async findAllJoin(params: {
    skip?: number;
    take?: number;
    cursor?: Prisma.ProductWhereUniqueInput;
    where?: Prisma.ProductWhereInput;
    orderBy?: Prisma.ProductOrderByWithRelationInput;
  }): Promise<Product[]> {
    const { skip, take, cursor, where, orderBy } = params;

    return await this.prisma.product.findMany({
      skip,
      take,
      cursor,
      where,
      orderBy,
      include: {
        inventory: true
      },
    });
  }

  async update(
    uuid: string,
    data: Prisma.ProductUpdateInput,
  ): Promise<Product> {
    return await this.prisma.product.update({
      where: { uuid },
      data,
    });
  }

  async delete(uuid: string): Promise<Product> {
    return await this.prisma.product.update({
      where: { uuid },
      data: { isDeleted: true },
    });
  }
}
