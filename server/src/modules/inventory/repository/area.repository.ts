import { Injectable } from '@nestjs/common';
import { PrismaService } from '../../../common/providers/prisma.service';
import { IAreaRepository } from '../interfaces/area.interface';
import { Area, Prisma } from '@prisma/client';

@Injectable()
export class AreaRepository implements IAreaRepository {

  constructor(private readonly prisma: PrismaService) {}

  async create(data: Prisma.AreaCreateInput): Promise<Area> {
    return await this.prisma.area.create({ data });
  }

  async findById(uuid: string): Promise<Area | null> {
    return await this.prisma.area.findUnique({
      where: { uuid },
    });
  }

  async findAll(params: {
    skip?: number;
    take?: number;
    cursor?: Prisma.AreaWhereUniqueInput;
    where?: Prisma.AreaWhereInput;
    orderBy?: Prisma.AreaOrderByWithRelationInput;
  }): Promise<Area[]> {
    const { skip, take, cursor, where, orderBy } = params;
    return await this.prisma.area.findMany({
      skip,
      take,
      cursor,
      where,
      orderBy,
    });
  }

  async update(uuid: string, data: Prisma.AreaUpdateInput): Promise<Area> {
    return await this.prisma.area.update({
      where: { uuid },
      data,
    });
  }

  async delete(uuid: string): Promise<Area> {
    return await this.prisma.area.update({
      where: { uuid },
      data: { isDeleted: true },
    });
  }
}
