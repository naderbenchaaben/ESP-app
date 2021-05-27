# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_16_154645) do

  create_table "categories", force: :cascade do |t|
    t.string "category_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "company_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "product_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "companyname"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.string "fieldofbusiness"
  end

  create_table "fieldofbusinesses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "path"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "order_id"
    t.integer "product_id"
    t.integer "quantity"
    t.float "order_item_price"
  end

  create_table "orders", force: :cascade do |t|
    t.string "order_type"
    t.float "total_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "company_id"
    t.string "stage"
    t.string "order_shipping_address"
    t.date "order_pick_up_date"
    t.time "order_pick_up_time"
    t.integer "user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "product_name"
    t.string "ref_product"
    t.float "price"
    t.string "description"
    t.integer "available_quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "category_id"
    t.integer "company_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "product_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "firstname"
    t.string "lastname"
    t.integer "telnum"
    t.string "companyname"
    t.string "fieldofbusiness"
    t.string "city"
    t.boolean "if_admin", default: false
    t.boolean "if_Topadmin", default: false
    t.boolean "if_client", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "categories", "companies"
  add_foreign_key "comments", "products"
  add_foreign_key "comments", "users"
  add_foreign_key "companies", "users"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "companies"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "companies"
  add_foreign_key "ratings", "products"
  add_foreign_key "ratings", "users"
end
