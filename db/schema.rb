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

ActiveRecord::Schema.define(version: 2021_05_08_022708) do

  create_table "photo_gallery_entries", charset: "utf8mb4", force: :cascade do |t|
    t.string "image"
    t.integer "likes_count", default: 0, null: false
    t.integer "views_count", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "photo_gallery_entry_likes", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "photo_gallery_entry_id", null: false
    t.bigint "user_id"
    t.string "browser_uid", null: false
    t.string "ip_address"
    t.text "user_agent", size: :long
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["photo_gallery_entry_id", "browser_uid"], name: "photo_gallery_entry_id_and_browser_uid", unique: true
    t.index ["photo_gallery_entry_id"], name: "index_photo_gallery_entry_likes_on_photo_gallery_entry_id"
    t.index ["user_id"], name: "index_photo_gallery_entry_likes_on_user_id"
  end

  create_table "photo_gallery_entry_views", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "photo_gallery_entry_id", null: false
    t.bigint "user_id"
    t.string "browser_uid", null: false
    t.string "ip_address"
    t.text "user_agent", size: :long
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["browser_uid"], name: "index_photo_gallery_entry_views_on_browser_uid", unique: true
    t.index ["photo_gallery_entry_id"], name: "index_photo_gallery_entry_views_on_photo_gallery_entry_id"
    t.index ["user_id"], name: "index_photo_gallery_entry_views_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", default: ""
    t.string "email", default: "", null: false
    t.string "description", default: ""
    t.string "facebook_url", default: ""
    t.string "instagram_url", default: ""
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "photo_gallery_entry_likes", "photo_gallery_entries"
  add_foreign_key "photo_gallery_entry_likes", "users"
  add_foreign_key "photo_gallery_entry_views", "photo_gallery_entries"
  add_foreign_key "photo_gallery_entry_views", "users"
end
