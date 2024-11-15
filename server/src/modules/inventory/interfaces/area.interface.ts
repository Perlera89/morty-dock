import { Area, Prisma } from '@prisma/client';

export interface IAreaRepository {

  create(data: Prisma.AreaCreateInput): Promise<Area>;

  findById(uuid: string): Promise<Area | null>;

  findAll(params: {
    skip?: number;
    take?: number;
    cursor?: Prisma.AreaWhereUniqueInput;
    where?: Prisma.AreaWhereInput;
    orderBy?: Prisma.AreaOrderByWithRelationInput;
  }): Promise<Area[]>;

  update(uuid: string, data: Prisma.AreaUpdateInput): Promise<Area>;

  delete(uuid: string): Promise<Area>;
}
