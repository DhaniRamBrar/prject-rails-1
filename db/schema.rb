
ActiveRecord::Schema[7.1].define(version: 2024_03_17_103530) do
  create_table "api_entries", force: :cascade do |t|
    t.string "api_name"
    t.text "description"
    t.string "auth"
    t.boolean "https"
    t.string "cors"
    t.string "link"
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_api_entries_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faker_data", force: :cascade do |t|
    t.integer "api_entry_id", null: false
    t.string "user_name"
    t.string "user_email"
    t.text "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["api_entry_id"], name: "index_faker_data_on_api_entry_id"
  end

  add_foreign_key "api_entries", "categories"
  add_foreign_key "faker_data", "api_entries"
end
