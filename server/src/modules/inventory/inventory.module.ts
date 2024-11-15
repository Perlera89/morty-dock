import { Module } from '@nestjs/common';
//** CONTROLLERS*/
import { ProductTypeController } from './controllers/product_type.controller';
import { CategoryController } from './controllers/category.controller';
import { AreaController } from './controllers/area.controller';
import { BrandController } from './controllers/brand.controller';
import { StoreController } from './controllers/store.controller';
import { ProductController } from './controllers/product.controller';
import { InventoryController } from './controllers/inventory.controller';
//** SERVICES */
import { AreaService } from './services/area.service';
import { BrandService } from './services/brand.service';
import { CategoryService } from './services/category.service';
import { InventoryService } from './services/inventory.service';
import { ProductTypeService } from './services/product_type.service';
import { ProductService } from './services/product.service';
import { StoreService } from './services/store.service';
//** COMMON */
import { PrismaService } from 'src/common/providers/prisma.service';
//** REPOSITORY */
//import { GenericRepository } from './repository/generic.repository';
import { AreaRepository } from './repository/area.repository';
import { BrandRepository } from './repository/brand.repository';
import { CategoryRepository } from './repository/category.repository';
import { InventoryRepository } from './repository/inventory.repository';
import { ProductTypeRepository } from './repository/product_type.repository';
import { ProductRepository } from './repository/product.repository';
import { StoreRepository } from './repository/store.repository';


@Module({
  controllers: [
    ProductTypeController,
    CategoryController,
    AreaController,
    BrandController,
    StoreController,
    ProductController,
    InventoryController,
  ],
  providers: [
    PrismaService,
    //GenericRepository,
    AreaRepository,
    BrandRepository,
    CategoryRepository,
    InventoryRepository,
    ProductTypeRepository,
    ProductRepository,
    StoreRepository,
    AreaService,
    BrandService,
    CategoryService,
    InventoryService,
    ProductTypeService,
    ProductService,
    StoreService,
  ],
})
export class InventoryModule {}
