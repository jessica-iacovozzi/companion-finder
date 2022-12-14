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

ActiveRecord::Schema[7.0].define(version: 2022_12_23_145134) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "hstore"
  enable_extension "plpgsql"

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "gender"
    t.string "size"
    t.string "coat"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organization_id"
    t.hstore "breeds", default: {}, null: false
    t.hstore "colors", default: {}, null: false
    t.hstore "environments", default: {}, null: false
    t.hstore "features", default: {}, null: false
    t.hstore "pictures", default: {}, null: false
    t.text "qualities", default: [], array: true
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.index ["breeds"], name: "dogs_breeds_idx", using: :gin
    t.index ["colors"], name: "dogs_colors_idx", using: :gin
    t.index ["environments"], name: "dogs_environments_idx", using: :gin
    t.index ["features"], name: "dogs_features_idx", using: :gin
    t.index ["organization_id"], name: "index_dogs_on_organization_id"
    t.index ["pictures"], name: "dogs_pictures_idx", using: :gin
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.string "postcode"
    t.string "picture"
    t.string "org_id"
    t.string "latitude"
    t.string "longitude"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "dogs", "organizations"
end
