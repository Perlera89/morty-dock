-- CreateTable
CREATE TABLE "user_status" (
    "uuid" UUID NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "description" TEXT,
    "created_at" TIMESTAMP(6) NOT NULL,
    "updated_at" TIMESTAMP(6) NOT NULL,
    "is_deleted" BOOLEAN,

    CONSTRAINT "user_status_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "risk_levels" (
    "uuid" UUID NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "description" TEXT,
    "created_at" TIMESTAMP(6) NOT NULL,
    "updated_at" TIMESTAMP(6) NOT NULL,
    "is_deleted" BOOLEAN,

    CONSTRAINT "risk_levels_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "department" (
    "uuid" UUID NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "is_deleted" BOOLEAN,

    CONSTRAINT "department_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "area" (
    "uuid" UUID NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "is_deleted" BOOLEAN,

    CONSTRAINT "area_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "brand" (
    "uuid" UUID NOT NULL,
    "name" VARCHAR(256) NOT NULL,
    "is_deleted" BOOLEAN,

    CONSTRAINT "brand_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "category" (
    "uuid" UUID NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "is_deleted" BOOLEAN,

    CONSTRAINT "category_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "invoice_status" (
    "uuid" UUID NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "is_deleted" BOOLEAN,

    CONSTRAINT "invoice_status_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "payment_method" (
    "uuid" UUID NOT NULL,
    "term" TIMESTAMP(6) NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "is_deleted" BOOLEAN,

    CONSTRAINT "payment_method_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "position" (
    "uuid" UUID NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "description" TEXT,
    "is_deleted" BOOLEAN,

    CONSTRAINT "position_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "genre" (
    "uuid" UUID NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "is_deleted" BOOLEAN,

    CONSTRAINT "genre_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "store" (
    "uuid" UUID NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "location" VARCHAR(256) NOT NULL,
    "ability" DECIMAL,

    CONSTRAINT "store_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "product_type" (
    "uuid" UUID NOT NULL,
    "name" VARCHAR(256) NOT NULL,
    "is_deleted" BOOLEAN,

    CONSTRAINT "product_type_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "attendance_status" (
    "uuid" UUID NOT NULL,
    "name" VARCHAR(256) NOT NULL,
    "description" TEXT,
    "is_deleted" BOOLEAN,

    CONSTRAINT "attendance_status_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "contract_type" (
    "uuid" UUID NOT NULL,
    "name" VARCHAR(256) NOT NULL,
    "is_deleted" BOOLEAN,

    CONSTRAINT "contract_type_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "transaction_type" (
    "uuid" UUID NOT NULL,
    "name" VARCHAR(256) NOT NULL,
    "is_deleted" BOOLEAN,

    CONSTRAINT "transaction_type_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "cash" (
    "uuid" UUID NOT NULL,
    "init_balance" DECIMAL,
    "end_balance" DECIMAL,
    "income" DECIMAL,
    "expensive" DECIMAL,
    "date" TIMESTAMP(6),
    "note" TEXT,
    "created_at" TIMESTAMP(6),
    "updated_at" TIMESTAMP(6),
    "is_deleted" BOOLEAN,

    CONSTRAINT "cash_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "modules" (
    "uuid" UUID NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "description" TEXT,
    "created_at" TIMESTAMP(6) NOT NULL,
    "updated_at" TIMESTAMP(6) NOT NULL,
    "is_deleted" BOOLEAN,

    CONSTRAINT "modules_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "roles" (
    "uuid" UUID NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "description" TEXT,
    "created_at" TIMESTAMP(6) NOT NULL,
    "updated_at" TIMESTAMP(6) NOT NULL,
    "is_deleted" BOOLEAN,

    CONSTRAINT "roles_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "operations" (
    "uuid" UUID NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "description" TEXT,
    "created_at" TIMESTAMP(6) NOT NULL,
    "updated_at" TIMESTAMP(6) NOT NULL,
    "is_deleted" BOOLEAN,
    "module_id" UUID,

    CONSTRAINT "operations_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "role_operations" (
    "uuid" UUID NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL,
    "updated_at" TIMESTAMP(6) NOT NULL,
    "is_deleted" BOOLEAN,
    "rol_id" UUID,
    "operation_id" UUID,

    CONSTRAINT "role_operations_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "user_accounts" (
    "uuid" UUID NOT NULL,
    "user_name" VARCHAR(50) NOT NULL,
    "email" VARCHAR(256) NOT NULL,
    "password" VARCHAR(512) NOT NULL,
    "salt" VARCHAR(512) NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL,
    "updated_at" TIMESTAMP(6) NOT NULL,
    "rol_id" UUID,
    "user_status_id" UUID,

    CONSTRAINT "user_accounts_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "access_log" (
    "uuid" UUID NOT NULL,
    "detail" TEXT NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL,
    "user_account_id" UUID,
    "risk_level_id" UUID,

    CONSTRAINT "access_log_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "event_log" (
    "uuid" UUID NOT NULL,
    "detail" TEXT NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL,
    "user_account_id" UUID,
    "risk_level_id" UUID,

    CONSTRAINT "event_log_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "user_activities" (
    "uuid" UUID NOT NULL,
    "detail" TEXT NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL,
    "user_account_id" UUID,
    "risk_level_id" UUID,

    CONSTRAINT "user_activities_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "district" (
    "uuid" UUID NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "is_deleted" BOOLEAN NOT NULL,
    "department_id" UUID,

    CONSTRAINT "district_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "city" (
    "uuid" UUID NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "is_deleted" BOOLEAN,
    "district_id" UUID,

    CONSTRAINT "city_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "address" (
    "uuid" UUID NOT NULL,
    "location" VARCHAR(255),
    "created_at" TIMESTAMP(6),
    "updated_at" TIMESTAMP(6),
    "is_deleted" BOOLEAN,
    "city_id" UUID,

    CONSTRAINT "address_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "tag" (
    "uuid" UUID NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "is_deleted" BOOLEAN,
    "category_id" UUID,

    CONSTRAINT "tag_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "inventory" (
    "uuid" UUID NOT NULL,
    "thumbnail" VARCHAR(255),
    "minimum_stock" DECIMAL,
    "safety_info" TEXT,
    "description" TEXT,
    "created_at" TIMESTAMP(6),
    "updated_at" TIMESTAMP(6),
    "is_deleted" BOOLEAN,
    "category_id" UUID,
    "product_type_id" UUID,
    "area_id" UUID,
    "brand_id" UUID,
    "store_id" UUID,

    CONSTRAINT "inventory_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "employee" (
    "uuid" UUID NOT NULL,
    "first_name" VARCHAR(100),
    "last_name" VARCHAR(100),
    "identification_number" VARCHAR(50),
    "phone" VARCHAR(50),
    "email" VARCHAR(256),
    "salary" DECIMAL,
    "genre_id" UUID,
    "address_id" UUID,
    "position_id" UUID,

    CONSTRAINT "employee_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "client" (
    "uuid" UUID NOT NULL,
    "first_name" VARCHAR(100),
    "last_name" VARCHAR(100),
    "identification_number" VARCHAR(100),
    "phone" VARCHAR(50),
    "email" VARCHAR(256),
    "relevant_info" TEXT,
    "created_at" TIMESTAMP(6),
    "updated_at" TIMESTAMP(6),
    "is_deleted" BOOLEAN,
    "address_id" UUID,

    CONSTRAINT "client_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "profile" (
    "uuid" UUID NOT NULL,
    "name" VARCHAR(100),
    "thumbnail" VARCHAR(255),
    "phone" VARCHAR(50),
    "email" VARCHAR(256),
    "nrc" VARCHAR(255),
    "description" TEXT,
    "created_at" TIMESTAMP(6),
    "updated_at" TIMESTAMP(6),
    "is_deleted" BOOLEAN,
    "address_id" UUID,

    CONSTRAINT "profile_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "provider" (
    "uuid" UUID NOT NULL,
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
    "address_id" UUID,

    CONSTRAINT "provider_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "account" (
    "uuid" UUID NOT NULL,
    "name" VARCHAR(255),
    "bank" VARCHAR(255),
    "balance" DECIMAL,
    "created_at" TIMESTAMP(6),
    "updated_at" TIMESTAMP(6),
    "is_deleted" BOOLEAN,
    "address_id" UUID,

    CONSTRAINT "account_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "product" (
    "uuid" UUID NOT NULL,
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
    "inventory_id" UUID,

    CONSTRAINT "product_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "tag_detail" (
    "uuid" UUID NOT NULL,
    "created_at" TIMESTAMP(6),
    "updated_at" TIMESTAMP(6),
    "is_deleted" BOOLEAN,
    "tag_id" UUID,
    "product_id" UUID,

    CONSTRAINT "tag_detail_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "purchase" (
    "uuid" UUID NOT NULL,
    "amount" DECIMAL,
    "price" DECIMAL,
    "product_id" UUID,
    "provider_id" UUID,

    CONSTRAINT "purchase_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "sale" (
    "uuid" UUID NOT NULL,
    "is_cancel" BOOLEAN,
    "created_at" TIMESTAMP(6),
    "updated_at" TIMESTAMP(6),
    "is_deleted" BOOLEAN,
    "payment_method_id" UUID,
    "invoice_status_id" UUID,
    "employee_id" UUID,
    "client_id" UUID,

    CONSTRAINT "sale_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "purchase_details" (
    "uuid" UUID NOT NULL,
    "is_cancel" BOOLEAN,
    "created_at" TIMESTAMP(6),
    "updated_at" TIMESTAMP(6),
    "is_deleted" BOOLEAN,
    "payment_method_id" UUID,
    "invoice_status_id" UUID,
    "employee_id" UUID,
    "provider_id" UUID,

    CONSTRAINT "purchase_details_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "sale_details" (
    "uuid" UUID NOT NULL,
    "amount" INTEGER,
    "price" DECIMAL,
    "discount" DECIMAL,
    "is_deleted" BOOLEAN,
    "sale_id" UUID,
    "product_id" UUID,

    CONSTRAINT "sale_details_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "sale_point" (
    "uuid" UUID NOT NULL,
    "name" VARCHAR(255),
    "code" VARCHAR(255),
    "state" VARCHAR(255),
    "balance" DECIMAL,
    "is_deleted" BOOLEAN,
    "employee_id" UUID,
    "cash_id" UUID,

    CONSTRAINT "sale_point_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "schedule" (
    "uuid" UUID NOT NULL,
    "entry_time" TIME(6),
    "exit_time" TIME(6),
    "duration" TIME(6),
    "created_at" TIMESTAMP(6),
    "updated_at" TIMESTAMP(6),
    "is_deleted" BOOLEAN,
    "employee_id" UUID,

    CONSTRAINT "schedule_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "attendance" (
    "uuid" UUID NOT NULL,
    "date" DATE,
    "timestamp" TIMESTAMP(6),
    "created_at" TIMESTAMP(6),
    "updated_at" TIMESTAMP(6),
    "is_deleted" BOOLEAN,
    "schedule_id" UUID,

    CONSTRAINT "attendance_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "contract" (
    "uuid" UUID NOT NULL,
    "start_date" TIMESTAMP(6),
    "end_date" TIMESTAMP(6),
    "salary" DECIMAL,
    "signed_on" TIMESTAMP(6),
    "created_at" TIMESTAMP(6),
    "updated_at" TIMESTAMP(6),
    "is_deleted" BOOLEAN,
    "contract_type_id" UUID,

    CONSTRAINT "contract_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "transaction" (
    "uuid" UUID NOT NULL,
    "amount" DECIMAL,
    "issue_date" DATE,
    "reference" VARCHAR(255),
    "employee_id" UUID,
    "transaction_type_id" UUID,
    "account_id" UUID,

    CONSTRAINT "transaction_pkey" PRIMARY KEY ("uuid")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_status_uuid_key" ON "user_status"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "user_status_name_key" ON "user_status"("name");

-- CreateIndex
CREATE UNIQUE INDEX "risk_levels_uuid_key" ON "risk_levels"("uuid");

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
CREATE UNIQUE INDEX "modules_uuid_key" ON "modules"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "modules_name_key" ON "modules"("name");

-- CreateIndex
CREATE UNIQUE INDEX "roles_uuid_key" ON "roles"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "roles_name_key" ON "roles"("name");

-- CreateIndex
CREATE UNIQUE INDEX "operations_uuid_key" ON "operations"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "operations_name_key" ON "operations"("name");

-- CreateIndex
CREATE UNIQUE INDEX "role_operations_uuid_key" ON "role_operations"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "user_accounts_uuid_key" ON "user_accounts"("uuid");

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
ALTER TABLE "operations" ADD CONSTRAINT "operations_module_id_fkey" FOREIGN KEY ("module_id") REFERENCES "modules"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "role_operations" ADD CONSTRAINT "role_operations_operation_id_fkey" FOREIGN KEY ("operation_id") REFERENCES "operations"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "role_operations" ADD CONSTRAINT "role_operations_rol_id_fkey" FOREIGN KEY ("rol_id") REFERENCES "roles"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "user_accounts" ADD CONSTRAINT "user_accounts_rol_id_fkey" FOREIGN KEY ("rol_id") REFERENCES "roles"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "user_accounts" ADD CONSTRAINT "user_accounts_user_status_id_fkey" FOREIGN KEY ("user_status_id") REFERENCES "user_status"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "access_log" ADD CONSTRAINT "access_log_risk_level_id_fkey" FOREIGN KEY ("risk_level_id") REFERENCES "risk_levels"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "access_log" ADD CONSTRAINT "access_log_user_account_id_fkey" FOREIGN KEY ("user_account_id") REFERENCES "user_accounts"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "event_log" ADD CONSTRAINT "event_log_risk_level_id_fkey" FOREIGN KEY ("risk_level_id") REFERENCES "risk_levels"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "event_log" ADD CONSTRAINT "event_log_user_account_id_fkey" FOREIGN KEY ("user_account_id") REFERENCES "user_accounts"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "user_activities" ADD CONSTRAINT "user_activities_risk_level_id_fkey" FOREIGN KEY ("risk_level_id") REFERENCES "risk_levels"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "user_activities" ADD CONSTRAINT "user_activities_user_account_id_fkey" FOREIGN KEY ("user_account_id") REFERENCES "user_accounts"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "district" ADD CONSTRAINT "district_department_id_fkey" FOREIGN KEY ("department_id") REFERENCES "department"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "city" ADD CONSTRAINT "city_district_id_fkey" FOREIGN KEY ("district_id") REFERENCES "district"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "address" ADD CONSTRAINT "address_city_id_fkey" FOREIGN KEY ("city_id") REFERENCES "city"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tag" ADD CONSTRAINT "tag_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "category"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "inventory" ADD CONSTRAINT "inventory_area_id_fkey" FOREIGN KEY ("area_id") REFERENCES "area"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "inventory" ADD CONSTRAINT "inventory_brand_id_fkey" FOREIGN KEY ("brand_id") REFERENCES "brand"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "inventory" ADD CONSTRAINT "inventory_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "category"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "inventory" ADD CONSTRAINT "inventory_product_type_id_fkey" FOREIGN KEY ("product_type_id") REFERENCES "product_type"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "inventory" ADD CONSTRAINT "inventory_store_id_fkey" FOREIGN KEY ("store_id") REFERENCES "store"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "employee" ADD CONSTRAINT "employee_address_id_fkey" FOREIGN KEY ("address_id") REFERENCES "address"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "employee" ADD CONSTRAINT "employee_genre_id_fkey" FOREIGN KEY ("genre_id") REFERENCES "genre"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "employee" ADD CONSTRAINT "employee_position_id_fkey" FOREIGN KEY ("position_id") REFERENCES "position"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "client" ADD CONSTRAINT "client_address_id_fkey" FOREIGN KEY ("address_id") REFERENCES "address"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "profile" ADD CONSTRAINT "profile_address_id_fkey" FOREIGN KEY ("address_id") REFERENCES "address"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "provider" ADD CONSTRAINT "provider_address_id_fkey" FOREIGN KEY ("address_id") REFERENCES "address"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "account" ADD CONSTRAINT "account_address_id_fkey" FOREIGN KEY ("address_id") REFERENCES "address"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "product" ADD CONSTRAINT "product_inventory_id_fkey" FOREIGN KEY ("inventory_id") REFERENCES "inventory"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tag_detail" ADD CONSTRAINT "tag_detail_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "product"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tag_detail" ADD CONSTRAINT "tag_detail_tag_id_fkey" FOREIGN KEY ("tag_id") REFERENCES "tag"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "purchase" ADD CONSTRAINT "purchase_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "product"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "purchase" ADD CONSTRAINT "purchase_provider_id_fkey" FOREIGN KEY ("provider_id") REFERENCES "provider"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "sale" ADD CONSTRAINT "sale_client_id_fkey" FOREIGN KEY ("client_id") REFERENCES "client"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "sale" ADD CONSTRAINT "sale_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "employee"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "sale" ADD CONSTRAINT "sale_invoice_status_id_fkey" FOREIGN KEY ("invoice_status_id") REFERENCES "invoice_status"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "sale" ADD CONSTRAINT "sale_payment_method_id_fkey" FOREIGN KEY ("payment_method_id") REFERENCES "payment_method"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "purchase_details" ADD CONSTRAINT "purchase_details_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "employee"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "purchase_details" ADD CONSTRAINT "purchase_details_invoice_status_id_fkey" FOREIGN KEY ("invoice_status_id") REFERENCES "invoice_status"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "purchase_details" ADD CONSTRAINT "purchase_details_payment_method_id_fkey" FOREIGN KEY ("payment_method_id") REFERENCES "payment_method"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "purchase_details" ADD CONSTRAINT "purchase_details_provider_id_fkey" FOREIGN KEY ("provider_id") REFERENCES "provider"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "sale_details" ADD CONSTRAINT "sale_details_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "product"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "sale_details" ADD CONSTRAINT "sale_details_sale_id_fkey" FOREIGN KEY ("sale_id") REFERENCES "sale"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "sale_point" ADD CONSTRAINT "sale_point_cash_id_fkey" FOREIGN KEY ("cash_id") REFERENCES "cash"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "sale_point" ADD CONSTRAINT "sale_point_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "employee"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "schedule" ADD CONSTRAINT "schedule_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "employee"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "attendance" ADD CONSTRAINT "attendance_schedule_id_fkey" FOREIGN KEY ("schedule_id") REFERENCES "schedule"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "contract" ADD CONSTRAINT "contract_contract_type_id_fkey" FOREIGN KEY ("contract_type_id") REFERENCES "contract_type"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "transaction" ADD CONSTRAINT "transaction_account_id_fkey" FOREIGN KEY ("account_id") REFERENCES "account"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "transaction" ADD CONSTRAINT "transaction_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "employee"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "transaction" ADD CONSTRAINT "transaction_transaction_type_id_fkey" FOREIGN KEY ("transaction_type_id") REFERENCES "transaction_type"("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION;
