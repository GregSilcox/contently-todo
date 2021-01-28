ActiveRecord::Schema.define(version: 2021_01_27_055536) do

  create_table "lists", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "list_id"
    t.index ["list_id"], name: "index_tasks_on_list_id"
  end

  add_foreign_key "tasks", "lists"
end
