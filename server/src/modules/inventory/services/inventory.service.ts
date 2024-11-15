import { Injectable, NotFoundException } from '@nestjs/common';
import { InventoryRepository } from '../repository/inventory.repository';
import { DateTime } from 'luxon';
import { CreateInventoryDto, UpdateInventoryDto } from '../dto/inventory.dto';
import { Inventory } from '@prisma/client';

@Injectable()
export class InventoryService {
  constructor(private readonly inventoryRepository: InventoryRepository) {}

  async create(createInventoryDto: CreateInventoryDto): Promise<Inventory> {
    const createdAt = DateTime.now()
      .setZone('America/El_Salvador')
      .toFormat("yyyy-MM-dd'T'HH:mm'Z'");

    const createdAtDate = new Date(createdAt);

    const inventoryData = {
      thumbnail: createInventoryDto.thumbnail,
      minimumStock: createInventoryDto.minimumStock,
      safetyInfo: createInventoryDto.safetyInfo,
      description: createInventoryDto.description,
      createdAt: createdAtDate,
      updatedAt: null,
      isDeleted: createInventoryDto.isDeleted,
      categoryId: createInventoryDto.categoryId,
      areaId: createInventoryDto.areaId,
      brandId: createInventoryDto.brandId,
      productTypeId: createInventoryDto.productTypeId,
      storeId: createInventoryDto.storeId,
    };

    return this.inventoryRepository.create(inventoryData);
  }

  async findById(uuid: string): Promise<Inventory> {
    const inventory = await this.inventoryRepository.findById(uuid);
    if (!inventory)
      throw new NotFoundException(`Inventory with UUID ${uuid} not found`);
    return inventory;
  }

  async findAllJoin(params?: {
    skip?: number;
    take?: number;
    cursor?: { uuid: string };
    where?: { isDeleted?: boolean };
    orderBy?: { createdAt?: 'asc' | 'desc' };
  }): Promise<Inventory[]> {
    return this.inventoryRepository.findAllJoin(params || {});
  }

  async update(
    uuid: string,
    updateInventoryDto: UpdateInventoryDto,
  ): Promise<Inventory> {
    await this.findById(uuid);
    return this.inventoryRepository.update(uuid, updateInventoryDto);
  }

  async delete(uuid: string): Promise<Inventory> {
    await this.findById(uuid);
    return this.inventoryRepository.delete(uuid);
  }
}
