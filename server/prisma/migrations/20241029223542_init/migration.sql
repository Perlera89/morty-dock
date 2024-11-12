-- CreateTable
CREATE TABLE "user_status" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "description" TEXT,
    "created_at" TIMESTAMP(6) NOT NULL,
    "updated_at" TIMESTAMP(6) NOT NULL,
    "is_deleted" BOOLEAN,

    CONSTRAINT "user_status_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "risk_levels" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "description" TEXT,
    "created_at" TIMESTAMP(6) NOT NULL,
    "updated_at" TIMESTAMP(6) NOT NULL,
    "is_deleted" BOOLEAN,

    CONSTRAINT "risk_levels_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "department" (
    "id" SERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "is_deleted" BOOLEAN,

    CONSTRAINT "department_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "area" (
    "id" SERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "is_deleted" BOOLEAN,

    CONSTRAINT "area_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "brand" (
    "id" SERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "name" VARCHAR(256) NOT NULL,
    "is_deleted" BOOLEAN,

    CONSTRAINT "brand_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "category" (
    "id" SERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "is_deleted" BOOLEAN,

    CONSTRAINT "category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "invoice_status" (
    "id" SERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "is_deleted" BOOLEAN,

    CONSTRAINT "invoice_status_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "payment_method" (
    "id" SERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "term" TIMESTAMP(6) NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "is_deleted" BOOLEAN,

    CONSTRAINT "payment_method_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "position" (
    "id" SERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "description" TEXT,
    "is_deleted" BOOLEAN,

    CONSTRAINT "position_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "genre" (
    "id" SERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "is_deleted" BOOLEAN,

    CONSTRAINT "genre_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "store" (
    "id" BIGSERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "location" VARCHAR(256) NOT NULL,
    "ability" DECIMAL,

    CONSTRAINT "store_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "product_type" (
    "id" SERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "name" VARCHAR(256) NOT NULL,
    "is_deleted" BOOLEAN,

    CONSTRAINT "product_type_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "attendance_status" (
    "id" SERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "name" VARCHAR(256) NOT NULL,
    "description" TEXT,
    "is_deleted" BOOLEAN,

    CONSTRAINT "attendance_status_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "contract_type" (
    "id" SERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "name" VARCHAR(256) NOT NULL,
    "is_deleted" BOOLEAN,

    CONSTRAINT "contract_type_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "transaction_type" (
    "id" SERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "name" VARCHAR(256) NOT NULL,
    "is_deleted" BOOLEAN,

    CONSTRAINT "transaction_type_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cash" (
    "id" BIGSERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "init_balance" DECIMAL,
    "end_balance" DECIMAL,
    "income" DECIMAL,
    "expensive" DECIMAL,
    "date" TIMESTAMP(6),
    "note" TEXT,
    "created_at" TIMESTAMP(6),
    "updated_at" TIMESTAMP(6),
    "is_deleted" BOOLEAN,

    CONSTRAINT "cash_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "modules" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "description" TEXT,
    "created_at" TIMESTAMP(6) NOT NULL,
    "updated_at" TIMESTAMP(6) NOT NULL,
    "is_deleted" BOOLEAN,

    CONSTRAINT "modules_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "roles" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "description" TEXT,
    "created_at" TIMESTAMP(6) NOT NULL,
    "updated_at" TIMESTAMP(6) NOT NULL,
    "is_deleted" BOOLEAN,

    CONSTRAINT "roles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "operations" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "description" TEXT,
    "created_at" TIMESTAMP(6) NOT NULL,
    "updated_at" TIMESTAMP(6) NOT NULL,
    "is_deleted" BOOLEAN,
    "module_id" INTEGER,

    CONSTRAINT "operations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "role_operations" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL,
    "updated_at" TIMESTAMP(6) NOT NULL,
    "is_deleted" BOOLEAN,
    "rol_id" INTEGER,
    "operation_id" INTEGER,

    CONSTRAINT "role_operations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_accounts" (
    "id" SERIAL NOT NULL,
    "user_name" VARCHAR(50) NOT NULL,
    "email" VARCHAR(256) NOT NULL,
    "password" VARCHAR(512) NOT NULL,
    "salt" VARCHAR(512) NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL,
    "updated_at" TIMESTAMP(6) NOT NULL,
    "rol_id" INTEGER,
    "user_status_id" INTEGER,

    CONSTRAINT "user_accounts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "access_log" (
    "id" BIGSERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "detail" TEXT NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL,
    "user_account_id" INTEGER,
    "risk_level_id" INTEGER,

    CONSTRAINT "access_log_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "event_log" (
    "id" BIGSERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "detail" TEXT NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL,
    "user_account_id" INTEGER,
    "risk_level_id" INTEGER,

    CONSTRAINT "event_log_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_activities" (
    "id" BIGSERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "detail" TEXT NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL,
    "user_account_id" INTEGER,
    "risk_level_id" INTEGER,

    CONSTRAINT "user_activities_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "district" (
    "id" SERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "is_deleted" BOOLEAN NOT NULL,
    "department_id" INTEGER,

    CONSTRAINT "district_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "city" (
    "id" SERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "is_deleted" BOOLEAN,
    "district_id" INTEGER,

    CONSTRAINT "city_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "address" (
    "id" SERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "location" VARCHAR(255),
    "created_at" TIMESTAMP(6),
    "updated_at" TIMESTAMP(6),
    "is_deleted" BOOLEAN,
    "city_id" INTEGER,

    CONSTRAINT "address_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tag" (
    "id" SERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "is_deleted" BOOLEAN,
    "category_id" INTEGER,

    CONSTRAINT "tag_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "inventory" (
    "id" BIGSERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "thumbnail" VARCHAR(255),
    "minimum_stock" DECIMAL,
    "safety_info" TEXT,
    "description" TEXT,
    "created_at" TIMESTAMP(6),
    "updated_at" TIMESTAMP(6),
    "is_deleted" BOOLEAN,
    "category_id" INTEGER,
    "product_type_id" INTEGER,
    "area_id" INTEGER,
    "brand_id" INTEGER,
    "store_id" BIGINT,

    CONSTRAINT "inventory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "employee" (
    "id" BIGSERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "first_name" VARCHAR(100),
    "last_name" VARCHAR(100),
    "identification_number" VARCHAR(50),
    "phone" VARCHAR(50),
    "email" VARCHAR(256),
    "salary" DECIMAL,
    "genre_id" INTEGER,
    "address_id" INTEGER,
    "position_id" INTEGER,

    CONSTRAINT "employee_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "client" (
    "id" BIGSERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "first_name" VARCHAR(100),
    "last_name" VARCHAR(100),
    "identification_number" VARCHAR(100),
    "phone" VARCHAR(50),
    "email" VARCHAR(256),
    "relevant_info" TEXT,
    "created_at" TIMESTAMP(6),
    "updated_at" TIMESTAMP(6),
    "is_deleted" BOOLEAN,
    "address_id" INTEGER,

    CONSTRAINT "client_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "profile" (
    "id" BIGSERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "name" VARCHAR(100),
    "thumbnail" VARCHAR(255),
    "phone" VARCHAR(50),
    "email" VARCHAR(256),
    "nrc" VARCHAR(255),
    "description" TEXT,
    "created_at" TIMESTAMP(6),
    "updated_at" TIMESTAMP(6),
    "is_deleted" BOOLEAN,
    "address_id" INTEGER,

    CONSTRAINT "profile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "provider" (
    "id" BIGSERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "name" VARCHAR(100),
    "phone" VARCHAR(50),
    "email" VARCHAR(256),
    "payment_terms" TEXT,
    "return_policies" TEXT,
    "warranties" TEXT,
    "delivery_terms" TEXT,
    "created_at" TIMESTAMP(6),
    "updated_at" TIMESTAMP(6),
    "is_deleted" BOOLEAN,
    "address_id" INTEGER,

    CONSTRAINT "provider_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "account" (
    "id" BIGSERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "name" VARCHAR(255),
    "bank" VARCHAR(255),
    "balance" DECIMAL,
    "created_at" TIMESTAMP(6),
    "updated_at" TIMESTAMP(6),
    "is_deleted" BOOLEAN,
    "address_id" INTEGER,

    CONSTRAINT "account_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "product" (
    "id" BIGSERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "code" VARCHAR(255),
    "stock" INTEGER,
    "purchase_price" DECIMAL,
    "minimum_price" DECIMAL,
    "sale_price" DECIMAL,
    "iva" DECIMAL,
    "is_on_sale" BOOLEAN,
    "is_blocked" BOOLEAN,
    "created_at" TIMESTAMP(6),
    "updated_at" TIMESTAMP(6),
    "is_deleted" BOOLEAN,
    "inventory_id" BIGINT,

    CONSTRAINT "product_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tag_detail" (
    "id" SERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "created_at" TIMESTAMP(6),
    "updated_at" TIMESTAMP(6),
    "is_deleted" BOOLEAN,
    "tag_id" INTEGER,
    "product_id" BIGINT,

    CONSTRAINT "tag_detail_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "purchase" (
    "id" BIGSERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "amount" DECIMAL,
    "price" DECIMAL,
    "product_id" BIGINT,
    "provider_id" BIGINT,

    CONSTRAINT "purchase_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sale" (
    "id" BIGSERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "is_cancel" BOOLEAN,
    "created_at" TIMESTAMP(6),
    "updated_at" TIMESTAMP(6),
    "is_deleted" BOOLEAN,
    "payment_method_id" INTEGER,
    "invoice_status_id" INTEGER,
    "employee_id" BIGINT,
    "client_id" BIGINT,

    CONSTRAINT "sale_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "purchase_details" (
    "id" BIGSERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "is_cancel" BOOLEAN,
    "created_at" TIMESTAMP(6),
    "updated_at" TIMESTAMP(6),
    "is_deleted" BOOLEAN,
    "payment_method_id" INTEGER,
    "invoice_status_id" INTEGER,
    "employee_id" BIGINT,
    "provider_id" BIGINT,

    CONSTRAINT "purchase_details_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sale_details" (
    "id" BIGSERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "amount" INTEGER,
    "price" DECIMAL,
    "discount" DECIMAL,
    "is_deleted" BOOLEAN,
    "sale_id" BIGINT,
    "product_id" BIGINT,

    CONSTRAINT "sale_details_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sale_point" (
    "id" SERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "name" VARCHAR(255),
    "code" VARCHAR(255),
    "state" VARCHAR(255),
    "balance" DECIMAL,
    "is_deleted" BOOLEAN,
    "employee_id" BIGINT,
    "cash_id" BIGINT,

    CONSTRAINT "sale_point_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "schedule" (
    "id" SERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "entry_time" TIME(6),
    "exit_time" TIME(6),
    "duration" TIME(6),
    "created_at" TIMESTAMP(6),
    "updated_at" TIMESTAMP(6),
    "is_deleted" BOOLEAN,
    "employee_id" BIGINT,

    CONSTRAINT "schedule_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "attendance" (
    "id" BIGSERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "date" DATE,
    "timestamp" TIMESTAMP(6),
    "created_at" TIMESTAMP(6),
    "updated_at" TIMESTAMP(6),
    "is_deleted" BOOLEAN,
    "schedule_id" INTEGER,

    CONSTRAINT "attendance_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "contract" (
    "id" BIGSERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "start_date" TIMESTAMP(6),
    "end_date" TIMESTAMP(6),
    "salary" DECIMAL,
    "signed_on" TIMESTAMP(6),
    "created_at" TIMESTAMP(6),
    "updated_at" TIMESTAMP(6),
    "is_deleted" BOOLEAN,
    "contract_type_id" INTEGER,

    CONSTRAINT "contract_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "transaction" (
    "id" BIGSERIAL NOT NULL,
    "uuid" VARCHAR(36) NOT NULL,
    "amount" DECIMAL,
    "issue_date" DATE,
    "reference" VARCHAR(255),
    "employee_id" BIGINT,
    "transaction_type_id" INTEGER,
    "account_id" BIGINT,

    CONSTRAINT "transaction_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_status_name_key" ON "user_status"("name");

-- CreateIndex
CREATE UNIQUE INDEX "risk_levels_name_key" ON "risk_levels"("name");

-- CreateIndex
CREATE UNIQUE INDEX "department_uuid_key" ON "department"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "department_name_key" ON "department"("name");

-- CreateIndex
CREATE UNIQUE INDEX "area_uuid_key" ON "area"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "area_name_key" ON "area"("name");

-- CreateIndex
CREATE UNIQUE INDEX "brand_uuid_key" ON "brand"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "brand_name_key" ON "brand"("name");

-- CreateIndex
CREATE UNIQUE INDEX "category_uuid_key" ON "category"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "category_name_key" ON "category"("name");

-- CreateIndex
CREATE UNIQUE INDEX "invoice_status_uuid_key" ON "invoice_status"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "invoice_status_name_key" ON "invoice_status"("name");

-- CreateIndex
CREATE UNIQUE INDEX "payment_method_uuid_key" ON "payment_method"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "payment_method_name_key" ON "payment_method"("name");

-- CreateIndex
CREATE UNIQUE INDEX "position_uuid_key" ON "position"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "position_name_key" ON "position"("name");

-- CreateIndex
CREATE UNIQUE INDEX "genre_uuid_key" ON "genre"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "genre_name_key" ON "genre"("name");

-- CreateIndex
CREATE UNIQUE INDEX "store_uuid_key" ON "store"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "store_name_key" ON "store"("name");

-- CreateIndex
CREATE UNIQUE INDEX "product_type_uuid_key" ON "product_type"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "product_type_name_key" ON "product_type"("name");

-- CreateIndex
CREATE UNIQUE INDEX "attendance_status_uuid_key" ON "attendance_status"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "attendance_status_name_key" ON "attendance_status"("name");

-- CreateIndex
CREATE UNIQUE INDEX "contract_type_uuid_key" ON "contract_type"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "contract_type_name_key" ON "contract_type"("name");

-- CreateIndex
CREATE UNIQUE INDEX "transaction_type_uuid_key" ON "transaction_type"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "transaction_type_name_key" ON "transaction_type"("name");

-- CreateIndex
CREATE UNIQUE INDEX "cash_uuid_key" ON "cash"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "modules_name_key" ON "modules"("name");

-- CreateIndex
CREATE UNIQUE INDEX "roles_name_key" ON "roles"("name");

-- CreateIndex
CREATE UNIQUE INDEX "operations_name_key" ON "operations"("name");

-- CreateIndex
CREATE UNIQUE INDEX "user_accounts_user_name_key" ON "user_accounts"("user_name");

-- CreateIndex
CREATE UNIQUE INDEX "user_accounts_email_key" ON "user_accounts"("email");

-- CreateIndex
CREATE UNIQUE INDEX "access_log_uuid_key" ON "access_log"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "event_log_uuid_key" ON "event_log"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "user_activities_uuid_key" ON "user_activities"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "district_uuid_key" ON "district"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "district_name_key" ON "district"("name");

-- CreateIndex
CREATE UNIQUE INDEX "city_uuid_key" ON "city"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "city_name_key" ON "city"("name");

-- CreateIndex
CREATE UNIQUE INDEX "address_uuid_key" ON "address"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "tag_uuid_key" ON "tag"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "tag_name_key" ON "tag"("name");

-- CreateIndex
CREATE UNIQUE INDEX "inventory_uuid_key" ON "inventory"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "employee_uuid_key" ON "employee"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "client_uuid_key" ON "client"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "profile_uuid_key" ON "profile"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "provider_uuid_key" ON "provider"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "account_uuid_key" ON "account"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "product_uuid_key" ON "product"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "tag_detail_uuid_key" ON "tag_detail"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "purchase_uuid_key" ON "purchase"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "sale_uuid_key" ON "sale"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "purchase_details_uuid_key" ON "purchase_details"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "sale_details_uuid_key" ON "sale_details"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "sale_point_uuid_key" ON "sale_point"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "schedule_uuid_key" ON "schedule"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "attendance_uuid_key" ON "attendance"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "contract_uuid_key" ON "contract"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "transaction_uuid_key" ON "transaction"("uuid");

-- AddForeignKey
ALTER TABLE "operations" ADD CONSTRAINT "operations_module_id_fkey" FOREIGN KEY ("module_id") REFERENCES "modules"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "role_operations" ADD CONSTRAINT "role_operations_operation_id_fkey" FOREIGN KEY ("operation_id") REFERENCES "operations"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "role_operations" ADD CONSTRAINT "role_operations_rol_id_fkey" FOREIGN KEY ("rol_id") REFERENCES "roles"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "user_accounts" ADD CONSTRAINT "user_accounts_rol_id_fkey" FOREIGN KEY ("rol_id") REFERENCES "roles"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "user_accounts" ADD CONSTRAINT "user_accounts_user_status_id_fkey" FOREIGN KEY ("user_status_id") REFERENCES "user_status"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "access_log" ADD CONSTRAINT "access_log_risk_level_id_fkey" FOREIGN KEY ("risk_level_id") REFERENCES "risk_levels"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "access_log" ADD CONSTRAINT "access_log_user_account_id_fkey" FOREIGN KEY ("user_account_id") REFERENCES "user_accounts"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "event_log" ADD CONSTRAINT "event_log_risk_level_id_fkey" FOREIGN KEY ("risk_level_id") REFERENCES "risk_levels"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "event_log" ADD CONSTRAINT "event_log_user_account_id_fkey" FOREIGN KEY ("user_account_id") REFERENCES "user_accounts"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "user_activities" ADD CONSTRAINT "user_activities_risk_level_id_fkey" FOREIGN KEY ("risk_level_id") REFERENCES "risk_levels"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "user_activities" ADD CONSTRAINT "user_activities_user_account_id_fkey" FOREIGN KEY ("user_account_id") REFERENCES "user_accounts"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "district" ADD CONSTRAINT "district_department_id_fkey" FOREIGN KEY ("department_id") REFERENCES "department"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "city" ADD CONSTRAINT "city_district_id_fkey" FOREIGN KEY ("district_id") REFERENCES "district"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "address" ADD CONSTRAINT "address_city_id_fkey" FOREIGN KEY ("city_id") REFERENCES "city"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tag" ADD CONSTRAINT "tag_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "category"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "inventory" ADD CONSTRAINT "inventory_area_id_fkey" FOREIGN KEY ("area_id") REFERENCES "area"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "inventory" ADD CONSTRAINT "inventory_brand_id_fkey" FOREIGN KEY ("brand_id") REFERENCES "brand"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "inventory" ADD CONSTRAINT "inventory_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "category"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "inventory" ADD CONSTRAINT "inventory_product_type_id_fkey" FOREIGN KEY ("product_type_id") REFERENCES "product_type"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "inventory" ADD CONSTRAINT "inventory_store_id_fkey" FOREIGN KEY ("store_id") REFERENCES "store"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "employee" ADD CONSTRAINT "employee_address_id_fkey" FOREIGN KEY ("address_id") REFERENCES "address"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "employee" ADD CONSTRAINT "employee_genre_id_fkey" FOREIGN KEY ("genre_id") REFERENCES "genre"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "employee" ADD CONSTRAINT "employee_position_id_fkey" FOREIGN KEY ("position_id") REFERENCES "position"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "client" ADD CONSTRAINT "client_address_id_fkey" FOREIGN KEY ("address_id") REFERENCES "address"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "profile" ADD CONSTRAINT "profile_address_id_fkey" FOREIGN KEY ("address_id") REFERENCES "address"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "provider" ADD CONSTRAINT "provider_address_id_fkey" FOREIGN KEY ("address_id") REFERENCES "address"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "account" ADD CONSTRAINT "account_address_id_fkey" FOREIGN KEY ("address_id") REFERENCES "address"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "product" ADD CONSTRAINT "product_inventory_id_fkey" FOREIGN KEY ("inventory_id") REFERENCES "inventory"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tag_detail" ADD CONSTRAINT "tag_detail_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "product"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tag_detail" ADD CONSTRAINT "tag_detail_tag_id_fkey" FOREIGN KEY ("tag_id") REFERENCES "tag"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "purchase" ADD CONSTRAINT "purchase_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "product"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "purchase" ADD CONSTRAINT "purchase_provider_id_fkey" FOREIGN KEY ("provider_id") REFERENCES "provider"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "sale" ADD CONSTRAINT "sale_client_id_fkey" FOREIGN KEY ("client_id") REFERENCES "client"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "sale" ADD CONSTRAINT "sale_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "employee"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "sale" ADD CONSTRAINT "sale_invoice_status_id_fkey" FOREIGN KEY ("invoice_status_id") REFERENCES "invoice_status"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "sale" ADD CONSTRAINT "sale_payment_method_id_fkey" FOREIGN KEY ("payment_method_id") REFERENCES "payment_method"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "purchase_details" ADD CONSTRAINT "purchase_details_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "employee"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "purchase_details" ADD CONSTRAINT "purchase_details_invoice_status_id_fkey" FOREIGN KEY ("invoice_status_id") REFERENCES "invoice_status"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "purchase_details" ADD CONSTRAINT "purchase_details_payment_method_id_fkey" FOREIGN KEY ("payment_method_id") REFERENCES "payment_method"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "purchase_details" ADD CONSTRAINT "purchase_details_provider_id_fkey" FOREIGN KEY ("provider_id") REFERENCES "provider"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "sale_details" ADD CONSTRAINT "sale_details_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "product"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "sale_details" ADD CONSTRAINT "sale_details_sale_id_fkey" FOREIGN KEY ("sale_id") REFERENCES "sale"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "sale_point" ADD CONSTRAINT "sale_point_cash_id_fkey" FOREIGN KEY ("cash_id") REFERENCES "cash"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "sale_point" ADD CONSTRAINT "sale_point_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "employee"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "schedule" ADD CONSTRAINT "schedule_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "employee"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "attendance" ADD CONSTRAINT "attendance_schedule_id_fkey" FOREIGN KEY ("schedule_id") REFERENCES "schedule"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "contract" ADD CONSTRAINT "contract_contract_type_id_fkey" FOREIGN KEY ("contract_type_id") REFERENCES "contract_type"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "transaction" ADD CONSTRAINT "transaction_account_id_fkey" FOREIGN KEY ("account_id") REFERENCES "account"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "transaction" ADD CONSTRAINT "transaction_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "employee"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "transaction" ADD CONSTRAINT "transaction_transaction_type_id_fkey" FOREIGN KEY ("transaction_type_id") REFERENCES "transaction_type"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
