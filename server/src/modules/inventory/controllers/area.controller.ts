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
import { AreaService } from '../services/area.service';
import { CreateAreaDto, UpdateAreaDto } from '../dto/area.dto';
import { Area } from '@prisma/client';
import { ApiTags } from '@nestjs/swagger';

@Controller('area')
@ApiTags('Area')
export class AreaController {
  constructor(private readonly areaService: AreaService) {}

  @Post()
  async create(@Body() createAreaDto: CreateAreaDto): Promise<Area> {
    return this.areaService.create(createAreaDto);
  }

  @Get(':uuid')
  async findById(@Param('uuid') uuid: string): Promise<Area> {
    return this.areaService.findById(uuid);
  }

  @Get()
  async findAll(
    @Query('skip') skip?: number,
    @Query('take') take?: number,
    @Query('cursor') cursor?: string,
    @Query('isDeleted') isDeleted?: boolean,
    @Query('orderBy') orderBy?: 'asc' | 'desc',
  ): Promise<Area[]> {
    return this.areaService.findAll({
      skip,
      take,
      cursor: cursor ? { uuid: cursor } : undefined,
      where: isDeleted !== undefined ? { isDeleted } : undefined,
      orderBy: orderBy ? { name: orderBy } : undefined,
    });
  }

  @Put(':uuid')
  async update(
    @Param('uuid') uuid: string,
    @Body() updateAreaDto: UpdateAreaDto,
  ): Promise<Area> {
    return this.areaService.update(uuid, updateAreaDto);
  }

  @Delete(':uuid')
  @HttpCode(HttpStatus.NO_CONTENT)
  async delete(@Param('uuid') uuid: string): Promise<void> {
    await this.areaService.delete(uuid);
  }
}
