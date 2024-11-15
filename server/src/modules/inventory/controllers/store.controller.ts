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
import { StoreService } from '../services/store.service';
import { CreateStoreDto, UpdateStoreDto } from '../dto/store.dto';
import { Store } from '@prisma/client';
import { ApiTags } from '@nestjs/swagger';

@Controller('Store')
@ApiTags('Store')
export class StoreController {
  constructor(private readonly _StoreService: StoreService) {}

  @Post()
  async create(@Body() createStoreDto: CreateStoreDto): Promise<Store> {
    return this._StoreService.create(createStoreDto);
  }

  @Get(':uuid')
  async findById(@Param('uuid') uuid: string): Promise<Store> {
    return this._StoreService.findById(uuid);
  }

  @Get()
  async findAll(
    @Query('skip') skip?: number,
    @Query('take') take?: number,
    @Query('cursor') cursor?: string,
    @Query('isDeleted') isDeleted?: boolean,
    @Query('orderBy') orderBy?: 'asc' | 'desc',
  ): Promise<Store[]> {
    return this._StoreService.findAll({
      skip,
      take,
      cursor: cursor ? { uuid: cursor } : undefined,
      orderBy: orderBy ? { name: orderBy } : undefined,
    });
  }

  @Put(':uuid')
  async update(
    @Param('uuid') uuid: string,
    @Body() updateStoreDto: UpdateStoreDto,
  ): Promise<Store> {
    return this._StoreService.update(uuid, updateStoreDto);
  }
}
