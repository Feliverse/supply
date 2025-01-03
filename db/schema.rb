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

ActiveRecord::Schema[7.0].define(version: 2024_12_29_180202) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "marcas", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "subcategory_id", null: false
    t.string "logo"
    t.index ["subcategory_id"], name: "index_marcas_on_subcategory_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id", null: false
    t.bigint "subcategory_id", null: false
    t.bigint "marca_id", null: false
    t.bigint "tech_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["marca_id"], name: "index_products_on_marca_id"
    t.index ["subcategory_id"], name: "index_products_on_subcategory_id"
    t.index ["tech_id"], name: "index_products_on_tech_id"
  end

  create_table "subcategories", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_subcategories_on_category_id"
  end

  create_table "teches", force: :cascade do |t|
    t.string "format"
    t.integer "pieces_box"
    t.decimal "m2_box"
    t.string "tomo_calibre"
    t.string "lote"
    t.string "color"
    t.bigint "marca_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["marca_id"], name: "index_teches_on_marca_id"
  end

  add_foreign_key "marcas", "subcategories"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "marcas"
  add_foreign_key "products", "subcategories"
  add_foreign_key "products", "teches"
  add_foreign_key "subcategories", "categories"
  add_foreign_key "teches", "marcas"
end
