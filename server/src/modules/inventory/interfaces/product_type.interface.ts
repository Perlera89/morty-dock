import { ProductType, Prisma } from '@prisma/client';

export interface IProductTypeRepository {

  create(data: Prisma.ProductTypeCreateInput): Promise<ProductType>;

  findById(uuid: string): Promise<ProductType | null>;

  findAll(params: {
    skip?: number;
    take?: number;
    cursor?: Prisma.ProductTypeWhereUniqueInput;
    where?: Prisma.ProductTypeWhereInput;
    orderBy?: Prisma.ProductTypeOrderByWithRelationInput;
  }): Promise<ProductType[]>;

  update(uuid: string, data: Prisma.ProductTypeUpdateInput): Promise<ProductType>;

  delete(uuid: string): Promise<ProductType>;
}
