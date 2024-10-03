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

ActiveRecord::Schema[7.2].define(version: 2024_10_03_125633) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apartment_residents", force: :cascade do |t|
    t.bigint "apartment_id", null: false
    t.bigint "resident_id", null: false
    t.string "relationship_type", null: false
    t.datetime "start_date", null: false
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apartment_id"], name: "index_apartment_residents_on_apartment_id"
    t.index ["resident_id"], name: "index_apartment_residents_on_resident_id"
  end

  create_table "apartments", force: :cascade do |t|
    t.string "block"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.string "block"
    t.integer "number"
    t.datetime "received_at"
    t.string "reader_code"
    t.bigint "apartment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status", default: false, null: false
    t.datetime "deliveried_at"
    t.text "received_img"
    t.text "deliveried_img"
    t.index ["apartment_id"], name: "index_deliveries_on_apartment_id"
  end

  create_table "residents", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.integer "type"
    t.string "make"
    t.string "color"
    t.string "plate"
    t.bigint "apartment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apartment_id"], name: "index_vehicles_on_apartment_id"
  end

  add_foreign_key "apartment_residents", "apartments"
  add_foreign_key "apartment_residents", "residents"
  add_foreign_key "deliveries", "apartments"
  add_foreign_key "vehicles", "apartments"
end
