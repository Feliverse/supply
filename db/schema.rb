# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2025_01_13_203036) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "almacens", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articulos", force: :cascade do |t|
    t.string "name"
    t.bigint "subcategory_id", null: false
    t.bigint "marca_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["marca_id"], name: "index_articulos_on_marca_id"
    t.index ["subcategory_id"], name: "index_articulos_on_subcategory_id"
  end

  create_table "calidads", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.string "name", null: false
    t.string "nit", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventarios", force: :cascade do |t|
    t.integer "cantidad_disponible", null: false
    t.datetime "fecha_actualizacion", null: false
    t.bigint "almacen_id", null: false
    t.bigint "product_id"
    t.bigint "articulo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["almacen_id"], name: "index_inventarios_on_almacen_id"
    t.index ["articulo_id"], name: "index_inventarios_on_articulo_id"
    t.index ["product_id"], name: "index_inventarios_on_product_id"
  end

  create_table "marcas", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.string "contact_name"
    t.string "contact_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movimientos", force: :cascade do |t|
    t.string "tipo", null: false
    t.integer "cantidad", null: false
    t.datetime "fecha", null: false
    t.bigint "almacen_id", null: false
    t.bigint "product_id"
    t.bigint "articulo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["almacen_id"], name: "index_movimientos_on_almacen_id"
    t.index ["articulo_id"], name: "index_movimientos_on_articulo_id"
    t.index ["product_id"], name: "index_movimientos_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "tonocalibre"
    t.bigint "tech_id", null: false
    t.bigint "calidad_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["calidad_id"], name: "index_products_on_calidad_id"
    t.index ["tech_id"], name: "index_products_on_tech_id"
  end

  create_table "sales", force: :cascade do |t|
    t.datetime "fecha"
    t.integer "cantidad"
    t.bigint "cliente_id", null: false
    t.bigint "almacen_id", null: false
    t.bigint "product_id"
    t.bigint "articulo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["almacen_id"], name: "index_sales_on_almacen_id"
    t.index ["articulo_id"], name: "index_sales_on_articulo_id"
    t.index ["cliente_id"], name: "index_sales_on_cliente_id"
    t.index ["product_id"], name: "index_sales_on_product_id"
  end

  create_table "subcategories", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_subcategories_on_category_id"
  end

  create_table "teches", force: :cascade do |t|
    t.string "name"
    t.integer "pieces_box"
    t.decimal "m2_box"
    t.bigint "marca_id", null: false
    t.bigint "subcategory_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["marca_id"], name: "index_teches_on_marca_id"
    t.index ["subcategory_id"], name: "index_teches_on_subcategory_id"
  end

  add_foreign_key "articulos", "marcas"
  add_foreign_key "articulos", "subcategories"
  add_foreign_key "inventarios", "almacens"
  add_foreign_key "inventarios", "articulos"
  add_foreign_key "inventarios", "products"
  add_foreign_key "movimientos", "almacens"
  add_foreign_key "movimientos", "articulos"
  add_foreign_key "movimientos", "products"
  add_foreign_key "products", "calidads"
  add_foreign_key "products", "teches"
  add_foreign_key "sales", "almacens"
  add_foreign_key "sales", "articulos"
  add_foreign_key "sales", "clientes"
  add_foreign_key "sales", "products"
  add_foreign_key "subcategories", "categories"
  add_foreign_key "teches", "marcas"
  add_foreign_key "teches", "subcategories"
end
