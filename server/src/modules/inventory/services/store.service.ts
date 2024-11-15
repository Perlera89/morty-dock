import { Injectable, NotFoundException } from '@nestjs/common';
import { StoreRepository } from '../repository/store.repository';
import { CreateStoreDto, UpdateStoreDto } from '../dto/store.dto';
import { Store } from '@prisma/client';

@Injectable()
export class StoreService {
  constructor(private readonly _StoreRepository: StoreRepository) {}

  async create(createStoreDto: CreateStoreDto): Promise<Store> {
    return this._StoreRepository.create(createStoreDto);
  }

  async findById(uuid: string): Promise<Store> {
    const Store = await this._StoreRepository.findById(uuid);
    if (!Store)
      throw new NotFoundException(`Store with UUID ${uuid} not found`);
    return Store;
  }

  async findAll(params?: {
    skip?: number; 
    take?: number; 
    cursor?: { uuid: string }; 
    where?: { isDeleted?: boolean };
    orderBy?: { name?: 'asc' | 'desc' };
  }): Promise<Store[]> {
    return this._StoreRepository.findAll(params || {});
  }

  async update(uuid: string, updateStoreDto: UpdateStoreDto): Promise<Store> {
    await this.findById(uuid);
    return this._StoreRepository.update(uuid, updateStoreDto);
  }

  /*async delete(uuid: string): Promise<Store> {
    await this.findById(uuid); // Verifica la existencia del Store
    return this._StoreRepository.delete(uuid);
  }*/
}
