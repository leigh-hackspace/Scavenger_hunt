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


ActiveRecord::Schema.define(version: 2022_11_26_142625) do
end

ActiveRecord::Schema.define(version: 2022_08_10_210929) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

<<<<<<< HEAD

  create_table "cipher_items", force: :cascade do |t|
    t.string "cipher_text", default: ""
    t.string "clear_text", default: ""
    t.string "rotation", default: "26"
    t.string "item_uuid", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end


=======
>>>>>>> c80a7cf14a1afc91949f8d3152e00232c9e51f99
  create_table "hunters", force: :cascade do |t|
    t.string "hunter_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "hunter_uuid"
    t.boolean "is_admin", default: false
    t.bigint "bonus_item_id"
    t.string "email", default: "info@leighhack.org"
    t.index ["bonus_item_id"], name: "index_hunters_on_bonus_item_id"
  end

  create_table "hunters_items", id: false, force: :cascade do |t|
    t.bigint "hunter_id"
    t.bigint "item_id"
    t.index ["hunter_id"], name: "index_hunters_items_on_hunter_id"
    t.index ["item_id"], name: "index_hunters_items_on_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "item_uuid", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "code", default: ""
    t.string "image_path", default: ""
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
