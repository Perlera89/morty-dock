import { Injectable } from '@nestjs/common';
import { PrismaService } from '../../../common/providers/prisma.service';
import { ICategoryRepository } from '../interfaces/category.interface';
import { Category, Prisma } from '@prisma/client';

@Injectable()
export class CategoryRepository implements ICategoryRepository { 
  constructor(private readonly prisma: PrismaService) {}

  async create(data: Prisma.CategoryCreateInput): Promise<Category> {
    return await this.prisma.category.create({ data });
  }

  async findById(uuid: string): Promise<Category | null> {
    return await this.prisma.category.findUnique({
      where: { uuid },
    });
  }

  async findAll(params: {
    skip?: number;
    take?: number;
    cursor?: Prisma.CategoryWhereUniqueInput;
    where?: Prisma.CategoryWhereInput;
    orderBy?: Prisma.CategoryOrderByWithRelationInput;
  }): Promise<Category[]> {
    const { skip, take, cursor, where, orderBy } = params;
    return await this.prisma.category.findMany({
      skip,
      take,
      cursor,
      where,
      orderBy,
    });
  }

  async update(uuid: string, data: Prisma.CategoryUpdateInput): Promise<Category> {
    return await this.prisma.category.update({
      where: { uuid },
      data,
    });
  }

  async delete(uuid: string): Promise<Category> {
    return await this.prisma.category.update({
      where: { uuid },
      data: { isDeleted: true },
    });
  }
}
