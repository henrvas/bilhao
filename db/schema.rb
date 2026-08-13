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

ActiveRecord::Schema[8.1].define(version: 2026_08_13_131307) do
  create_table "educational_institutes", force: :cascade do |t|
    t.string "cnpj"
    t.datetime "created_at", null: false
    t.string "name"
    t.string "school_type"
    t.datetime "updated_at", null: false
  end

  create_table "enrolloments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.decimal "full_price_course"
    t.decimal "invoice_due_date"
    t.string "name_course"
    t.decimal "number_invoices"
    t.datetime "updated_at", null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "invoice_status"
    t.string "price_invoice"
    t.datetime "updated_at", null: false
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
end
