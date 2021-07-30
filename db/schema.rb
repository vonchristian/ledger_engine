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

ActiveRecord::Schema.define(version: 2021_07_30_101207) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "assets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "institution_type", null: false
    t.uuid "institution_id", null: false
    t.string "name"
    t.string "code"
    t.boolean "contra", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_assets_on_code"
    t.index ["institution_type", "institution_id"], name: "index_assets_on_institution"
  end

  create_table "debit_amounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "account_type", null: false
    t.uuid "account_id", null: false
    t.bigint "amount_cents", null: false
    t.uuid "entry_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_type", "account_id"], name: "index_debit_amounts_on_account"
    t.index ["entry_id"], name: "index_debit_amounts_on_entry_id"
  end

  create_table "entries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.date "entry_date"
    t.time "entry_time"
    t.string "description"
    t.string "reference_number"
    t.string "institution_type", null: false
    t.uuid "institution_id", null: false
    t.string "recording_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["entry_date"], name: "index_entries_on_entry_date"
    t.index ["entry_time"], name: "index_entries_on_entry_time"
    t.index ["institution_type", "institution_id"], name: "index_entries_on_institution"
    t.index ["recording_type"], name: "index_entries_on_recording_type"
  end

  create_table "equities", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "institution_type", null: false
    t.uuid "institution_id", null: false
    t.string "name"
    t.string "code"
    t.boolean "contra"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_equities_on_code"
    t.index ["institution_type", "institution_id"], name: "index_equities_on_institution"
  end

  create_table "expenses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "institution_type", null: false
    t.uuid "institution_id", null: false
    t.string "name"
    t.string "code"
    t.boolean "contra"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_expenses_on_code"
    t.index ["institution_type", "institution_id"], name: "index_expenses_on_institution"
  end

  create_table "liabilities", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "institution_type", null: false
    t.uuid "institution_id", null: false
    t.string "name"
    t.string "code"
    t.boolean "contra"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_liabilities_on_code"
    t.index ["institution_type", "institution_id"], name: "index_liabilities_on_institution"
  end

  create_table "revenues", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "institution_type", null: false
    t.uuid "institution_id", null: false
    t.string "name"
    t.string "code"
    t.boolean "contra"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_revenues_on_code"
    t.index ["institution_type", "institution_id"], name: "index_revenues_on_institution"
  end

  add_foreign_key "debit_amounts", "entries"
end
