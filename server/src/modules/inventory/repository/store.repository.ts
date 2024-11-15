import { Injectable } from '@nestjs/common';
import { PrismaService } from '../../../common/providers/prisma.service';
import { IStoreRepository } from '../interfaces/store.interface';
import { Store, Prisma } from '@prisma/client';

@Injectable()
export class StoreRepository implements IStoreRepository {

  constructor(private readonly prisma: PrismaService) {}

  async create(data: Prisma.StoreCreateInput): Promise<Store> {
    return await this.prisma.store.create({ data });
  }

  async findById(uuid: string): Promise<Store | null> {
    return await this.prisma.store.findUnique({
      where: { uuid },
    });
  }

  async findAll(params: {
    skip?: number;
    take?: number;
    cursor?: Prisma.StoreWhereUniqueInput;
    //where?: Prisma.StoreWhereInput;
    orderBy?: Prisma.StoreOrderByWithRelationInput;
  }): Promise<Store[]> {
    const { skip, take, cursor/*, where*/, orderBy } = params;
    return await this.prisma.store.findMany({
      skip,
      take,
      cursor,
      //where,
      orderBy,
    });
  }

  async update(
    uuid: string,
    data: Prisma.StoreUpdateInput,
  ): Promise<Store> {
    return await this.prisma.store.update({
      where: { uuid },
      data,
    });
  }

  /*async delete(uuid: string): Promise<Store> {
    return await this.prisma.store.update({
      where: { uuid },
      data: { isDeleted: true }, // Cambio del atributo isDelete a true para borrado logico
    });
  }*/
}
