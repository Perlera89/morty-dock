import { Category, Prisma } from '@prisma/client';

export interface ICategoryRepository {

  create(data: Prisma.CategoryCreateInput): Promise<Category>;

  findById(uuid: string): Promise<Category | null>;

  findAll(params: {
    skip?: number;
    take?: number;
    cursor?: Prisma.CategoryWhereUniqueInput;
    where?: Prisma.CategoryWhereInput;
    orderBy?: Prisma.CategoryOrderByWithRelationInput;
  }): Promise<Category[]>;

  update(uuid: string, data: Prisma.CategoryUpdateInput): Promise<Category>;

  delete(uuid: string): Promise<Category>;
}
