import {
  Controller,
  Get,
  Post,
  Patch,
  Delete,
  Param,
  Body,
  Query,
  HttpCode,
  HttpStatus,
  Put,
} from '@nestjs/common';
import { InventoryService } from '../services/inventory.service';
import { CreateInventoryDto, UpdateInventoryDto } from '../dto/inventory.dto';
import { Inventory } from '@prisma/client';
import { ApiTags } from '@nestjs/swagger';

@Controller('inventory')
@ApiTags('Inventory')
export class InventoryController {
  constructor(private readonly inventoryService: InventoryService) {}

  @Post()
  async create(
    @Body() createInventoryDto: CreateInventoryDto,
  ): Promise<Inventory> {
    return this.inventoryService.create(createInventoryDto);
  }

  @Get(':uuid')
  async findById(@Param('uuid') uuid: string): Promise<Inventory> {
    return this.inventoryService.findById(uuid);
  }

  @Get()
  async findAll(
    @Query('skip') skip?: number,
    @Query('take') take?: number,
    @Query('cursor') cursor?: string,
    @Query('isDeleted') isDeleted?: boolean,
    @Query('orderBy') orderBy?: 'asc' | 'desc',
  ): Promise<Inventory[]> {
    return this.inventoryService.findAllJoin({
      skip,
      take,
      cursor: cursor ? { uuid: cursor } : undefined,
      where: isDeleted !== undefined ? { isDeleted } : undefined,
      orderBy: orderBy ? { createdAt: orderBy } : undefined,
    });
  }

  @Put(':uuid')
  async update(
    @Param('uuid') uuid: string,
    @Body() updateInventoryDto: UpdateInventoryDto,
  ): Promise<Inventory> {
    return this.inventoryService.update(uuid, updateInventoryDto);
  }

  @Delete(':uuid')
  @HttpCode(HttpStatus.NO_CONTENT)
  async delete(@Param('uuid') uuid: string): Promise<void> {
    await this.inventoryService.delete(uuid);
  }
}
