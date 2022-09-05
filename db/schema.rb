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

ActiveRecord::Schema[7.0].define(version: 2022_09_05_162043) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accomodation_infos", force: :cascade do |t|
    t.string "url"
    t.string "title"
    t.text "description"
    t.bigint "wedding_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wedding_id"], name: "index_accomodation_infos_on_wedding_id"
  end

  create_table "registries", force: :cascade do |t|
    t.string "item_name"
    t.text "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_registries_on_user_id"
  end

  create_table "registry_items", force: :cascade do |t|
    t.bigint "registry_id", null: false
    t.bigint "wedding_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["registry_id"], name: "index_registry_items_on_registry_id"
    t.index ["wedding_id"], name: "index_registry_items_on_wedding_id"
  end

  create_table "rsvps", force: :cascade do |t|
    t.bigint "wedding_id", null: false
    t.bigint "wedding_guests_id", null: false
    t.text "meal_choice"
    t.text "spotify_song"
    t.string "attendance"
    t.string "attendee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wedding_guests_id"], name: "index_rsvps_on_wedding_guests_id"
    t.index ["wedding_id"], name: "index_rsvps_on_wedding_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.time "time"
    t.text "description"
    t.bigint "wedding_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wedding_id"], name: "index_schedules_on_wedding_id"
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

  create_table "vips", force: :cascade do |t|
    t.text "description"
    t.string "name"
    t.string "category"
    t.bigint "wedding_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wedding_id"], name: "index_vips_on_wedding_id"
  end

  create_table "wedding_guests", force: :cascade do |t|
    t.bigint "wedding_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wedding_guests_on_user_id"
    t.index ["wedding_id"], name: "index_wedding_guests_on_wedding_id"
  end

  create_table "weddings", force: :cascade do |t|
    t.text "info"
    t.date "date"
    t.bigint "user_id", null: false
    t.string "page_heading"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_weddings_on_user_id"
  end

  add_foreign_key "accomodation_infos", "weddings"
  add_foreign_key "registries", "users"
  add_foreign_key "registry_items", "registries"
  add_foreign_key "registry_items", "weddings"
  add_foreign_key "rsvps", "wedding_guests", column: "wedding_guests_id"
  add_foreign_key "rsvps", "weddings"
  add_foreign_key "schedules", "weddings"
  add_foreign_key "vips", "weddings"
  add_foreign_key "wedding_guests", "users"
  add_foreign_key "wedding_guests", "weddings"
  add_foreign_key "weddings", "users"
end
