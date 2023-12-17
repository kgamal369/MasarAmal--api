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

ActiveRecord::Schema[7.1].define(version: 0) do
  create_schema "German Course"
  create_schema "MDM_ProtoType"
  create_schema "MES"
  create_schema "masar"
  create_schema "mdm"
  create_schema "pgagent"

  # These are extensions that must be enabled in order to support this database
  enable_extension "adminpack"
  enable_extension "pgagent"
  enable_extension "plpgsql"

  create_table "blog_posts", id: :serial, force: :cascade do |t|
    t.string "header", null: false
    t.text "text"
    t.datetime "last_modified", precision: nil
  end

  create_table "doctors", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.text "text"
    t.string "pictures"
    t.datetime "last_modified", precision: nil
  end

  create_table "facilities", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.text "text"
    t.string "pictures"
    t.datetime "last_modified", precision: nil
  end

  create_table "mental_service", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.text "text"
    t.datetime "last_modified", precision: nil
  end

  create_table "message", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "email"
    t.string "phone"
    t.text "message"
    t.datetime "datetime", precision: nil
  end

  create_table "news_events", id: :serial, force: :cascade do |t|
    t.string "header", null: false
    t.text "text"
    t.date "date_of_events"
    t.datetime "last_modified", precision: nil
  end

  create_table "roles", primary_key: "role_id", id: :serial, force: :cascade do |t|
    t.string "role_name", null: false

    t.unique_constraint ["role_name"], name: "roles_role_name_key"
  end

  create_table "treatment_approach", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.text "text"
    t.datetime "last_modified", precision: nil
  end

  create_table "user_roles", primary_key: ["user_id", "role_id"], force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
  end

  create_table "users", primary_key: "user_id", id: :serial, force: :cascade do |t|
    t.string "username", null: false
    t.string "password", null: false
    t.string "email", null: false
    t.string "full_name"
    t.datetime "registration_date", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "last_login", precision: nil

    t.unique_constraint ["email"], name: "users_email_key"
    t.unique_constraint ["username"], name: "users_username_key"
  end

  add_foreign_key "user_roles", "roles", primary_key: "role_id", name: "user_roles_role_id_fkey"
  add_foreign_key "user_roles", "users", primary_key: "user_id", name: "user_roles_user_id_fkey"
end
