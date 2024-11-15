import { Product, Prisma } from '@prisma/client';

export interface IProductRepository {

  create(data: Prisma.ProductCreateInput): Promise<Product>;

  findById(uuid: string): Promise<Product | null>;

findAllJoin(params: {
  skip?: number;
  take?: number;
  cursor?: Prisma.ProductWhereUniqueInput;
  where?: Prisma.ProductWhereInput;
  orderBy?: Prisma.ProductOrderByWithRelationInput;
}): Promise<Product[]>;


  update(uuid: string, data: Prisma.ProductUpdateInput): Promise<Product>;

  delete(uuid: string): Promise<Product>;
}
