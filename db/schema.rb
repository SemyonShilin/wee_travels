# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_14_161542) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "communications", force: :cascade do |t|
    t.bigint "conversation_id"
    t.bigint "message_id"
    t.string "user_type"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["conversation_id"], name: "index_communications_on_conversation_id"
    t.index ["message_id"], name: "index_communications_on_message_id"
    t.index ["user_type", "user_id"], name: "index_communications_on_user_type_and_user_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "tour_id"
    t.boolean "dialog", default: true, null: false
    t.index ["tour_id"], name: "index_conversations_on_tour_id"
  end

  create_table "customers", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "conversation_id"
    t.string "owner_type"
    t.bigint "owner_id"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["owner_type", "owner_id"], name: "index_messages_on_owner_type_and_owner_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "tour_id"
    t.string "comment"
    t.integer "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_ratings_on_customer_id"
    t.index ["tour_id"], name: "index_ratings_on_tour_id"
  end

  create_table "tour_agents", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tours", force: :cascade do |t|
    t.bigint "tour_agent_id"
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "rating", precision: 3, scale: 2, default: "0.0"
    t.decimal "price", precision: 15, scale: 2
    t.integer "ratings_count"
    t.index ["tour_agent_id"], name: "index_tours_on_tour_agent_id"
  end

  add_foreign_key "communications", "conversations"
  add_foreign_key "communications", "messages"
  add_foreign_key "conversations", "tours"
  add_foreign_key "messages", "conversations"
  add_foreign_key "ratings", "customers"
  add_foreign_key "ratings", "tours"
  add_foreign_key "tours", "tour_agents"
end
