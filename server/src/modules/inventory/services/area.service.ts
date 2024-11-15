import { Injectable, NotFoundException } from '@nestjs/common';
import { AreaRepository } from '../repository/area.repository';
import { CreateAreaDto, UpdateAreaDto } from '../dto/area.dto';
import { Area } from '@prisma/client';

@Injectable()
export class AreaService {
  constructor(private readonly areaRepository: AreaRepository) {}

  async create(createAreaDto: CreateAreaDto): Promise<Area> {
    return this.areaRepository.create(createAreaDto);
  }

  async findById(uuid: string): Promise<Area> {
    const area = await this.areaRepository.findById(uuid);
    if (!area) throw new NotFoundException(`Area with UUID ${uuid} not found`);
    return area;
  }

  async findAll(params?: {
    skip?: number; 
    take?: number;
    cursor?: { uuid: string };
    where?: { isDeleted?: boolean };
    orderBy?: { name?: 'asc' | 'desc' };
  }): Promise<Area[]> {
    return this.areaRepository.findAll(params || {});
  }

  async update(uuid: string, updateAreaDto: UpdateAreaDto): Promise<Area> {
    await this.findById(uuid);
    return this.areaRepository.update(uuid, updateAreaDto);
  }

  async delete(uuid: string): Promise<Area> {
    await this.findById(uuid);
    return this.areaRepository.delete(uuid);
  }
}