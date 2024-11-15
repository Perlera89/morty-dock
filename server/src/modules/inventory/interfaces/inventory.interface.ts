import { Inventory, Prisma } from '@prisma/client';

export interface IInventoryRepository {

  create(data: Prisma.InventoryCreateInput): Promise<Inventory>;

  findById(uuid: string): Promise<Inventory | null>;

findAllJoin(params: {
  skip?: number;
  take?: number;
  cursor?: Prisma.InventoryWhereUniqueInput;
  where?: Prisma.InventoryWhereInput;
  orderBy?: Prisma.InventoryOrderByWithRelationInput;
}): Promise<Inventory[]>;


  update(uuid: string, data: Prisma.InventoryUpdateInput): Promise<Inventory>;

  delete(uuid: string): Promise<Inventory>;
}
