import { Brand, Prisma } from '@prisma/client';

export interface IBrandRepository {

  create(data: Prisma.BrandCreateInput): Promise<Brand>;

  findById(uuid: string): Promise<Brand | null>;

  findAll(params: {
    skip?: number;
    take?: number;
    cursor?: Prisma.BrandWhereUniqueInput;
    where?: Prisma.BrandWhereInput;
    orderBy?: Prisma.BrandOrderByWithRelationInput;
  }): Promise<Brand[]>;

  update(uuid: string, data: Prisma.BrandUpdateInput): Promise<Brand>;

  delete(uuid: string): Promise<Brand>;
}
