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

ActiveRecord::Schema[8.1].define(version: 2026_08_21_113655) do
  create_table "educational_institutes", force: :cascade do |t|
    t.string "cnpj"
    t.datetime "created_at", null: false
    t.string "name"
    t.string "school_type"
    t.string "status_educational_institute", default: "ativo"
    t.datetime "updated_at", null: false
  end

  create_table "enrolloments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "educational_institute_id"
    t.decimal "full_price_course"
    t.integer "invoice_due_date"
    t.string "name_course"
    t.integer "number_invoices"
    t.integer "student_id"
    t.datetime "updated_at", null: false
    t.index ["educational_institute_id"], name: "index_enrolloments_on_educational_institute_id"
    t.index ["student_id"], name: "index_enrolloments_on_student_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "enrolloment_id", null: false
    t.date "invoice_due_date"
    t.string "invoice_status"
    t.decimal "price_invoice"
    t.datetime "updated_at", null: false
    t.index ["enrolloment_id"], name: "index_invoices_on_enrolloment_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "descricao"
    t.string "nome"
    t.decimal "preco"
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.decimal "cell_number"
    t.string "cpf"
    t.datetime "created_at", null: false
    t.date "date_of_birth"
    t.string "gender"
    t.string "method_of_payment"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "enrolloments", "educational_institutes"
  add_foreign_key "enrolloments", "students"
  add_foreign_key "invoices", "enrolloments"
end
