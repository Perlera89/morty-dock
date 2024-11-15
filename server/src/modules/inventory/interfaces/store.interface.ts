import { Store, Prisma } from '@prisma/client';

export interface IStoreRepository {
  create(data: Prisma.StoreCreateInput): Promise<Store>;

  findById(uuid: string): Promise<Store | null>;

  findAll(params: {
    skip?: number;
    take?: number;
    cursor?: Prisma.StoreWhereUniqueInput;
    where?: Prisma.StoreWhereInput;
    orderBy?: Prisma.StoreOrderByWithRelationInput;
  }): Promise<Store[]>;

  update(uuid: string, data: Prisma.StoreUpdateInput): Promise<Store>;

  //delete(uuid: string): Promise<Store>;
}
