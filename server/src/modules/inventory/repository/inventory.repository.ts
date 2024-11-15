import { Injectable } from '@nestjs/common';
import { PrismaService } from '../../../common/providers/prisma.service';
import { IInventoryRepository } from '../interfaces/inventory.interface';
import { Inventory, Prisma } from '@prisma/client';

@Injectable()
export class InventoryRepository implements IInventoryRepository {
  constructor(private readonly prisma: PrismaService) {}

  async create(data: Prisma.InventoryCreateInput): Promise<Inventory> {
    return await this.prisma.inventory.create({ data });
  }

  async findById(uuid: string): Promise<Inventory | null> {
    return await this.prisma.inventory.findUnique({
      where: { uuid },
    });
  }

  async findAllJoin(params: {
    skip?: number;
    take?: number;
    cursor?: Prisma.InventoryWhereUniqueInput;
    where?: Prisma.InventoryWhereInput;
    orderBy?: Prisma.InventoryOrderByWithRelationInput;
  }): Promise<Inventory[]> {
    const { skip, take, cursor, where, orderBy } = params;

    return await this.prisma.inventory.findMany({
      skip,
      take,
      cursor,
      where,
      orderBy,
      include: {
        area: true, 
        brand: true,
        category: true,
        productType: true,
        store: true,
      },
    });
  }

  async update(
    uuid: string,
    data: Prisma.InventoryUpdateInput,
  ): Promise<Inventory> {
    return await this.prisma.inventory.update({
      where: { uuid },
      data,
    });
  }

  async delete(uuid: string): Promise<Inventory> {
    return await this.prisma.inventory.update({
      where: { uuid },
      data: { isDeleted: true },
    });
  }
}
