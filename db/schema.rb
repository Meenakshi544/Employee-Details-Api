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

ActiveRecord::Schema[7.1].define(version: 2024_02_21_095443) do
  create_table "employee_details", force: :cascade do |t|
    t.string "employee_id"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "doj"
    t.integer "salary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employee_phone_numbers", force: :cascade do |t|
    t.string "phone_number"
    t.integer "employee_details_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_details_id"], name: "index_employee_phone_numbers_on_employee_details_id"
  end

  add_foreign_key "employee_phone_numbers", "employee_details", column: "employee_details_id"
end
