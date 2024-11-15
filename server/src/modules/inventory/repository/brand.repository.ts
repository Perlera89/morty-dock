import { Injectable } from '@nestjs/common';
import { PrismaService } from '../../../common/providers/prisma.service';
import { IBrandRepository } from '../interfaces/brand.interface';
import { Brand, Prisma } from '@prisma/client';

@Injectable()
export class BrandRepository implements IBrandRepository {

  constructor(private readonly prisma: PrismaService) {}

  async create(data: Prisma.BrandCreateInput): Promise<Brand> {
    return await this.prisma.brand.create({ data });
  }

  async findById(uuid: string): Promise<Brand | null> {
    return await this.prisma.brand.findUnique({
      where: { uuid },
    });
  }

  async findAll(params: {
    skip?: number;
    take?: number;
    cursor?: Prisma.BrandWhereUniqueInput;
    where?: Prisma.BrandWhereInput;
    orderBy?: Prisma.BrandOrderByWithRelationInput;
  }): Promise<Brand[]> {
    const { skip, take, cursor, where, orderBy } = params;
    return await this.prisma.brand.findMany({
      skip,
      take,
      cursor,
      where,
      orderBy,
    });
  }

  async update(uuid: string, data: Prisma.BrandUpdateInput): Promise<Brand> {
    return await this.prisma.brand.update({
      where: { uuid },
      data,
    });
  }

  async delete(uuid: string): Promise<Brand> {
    return await this.prisma.brand.update({
      where: { uuid },
      data: { isDeleted: true },
    });
  }
}
