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

ActiveRecord::Schema.define(version: 2021_07_30_093914) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "assets", force: :cascade do |t|
    t.string "institution_type", null: false
    t.bigint "institution_id", null: false
    t.string "name"
    t.string "code"
    t.boolean "contra", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_assets_on_code"
    t.index ["institution_type", "institution_id"], name: "index_assets_on_institution"
  end

  create_table "liabilities", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "institution_type", null: false
    t.uuid "institution_id", null: false
    t.string "name"
    t.string "code"
    t.boolean "contra"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["institution_type", "institution_id"], name: "index_liabilities_on_institution"
  end

end
