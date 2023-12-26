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

ActiveRecord::Schema[7.1].define(version: 2023_12_26_034325) do
  create_schema "masar"

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "blog_posts", id: :serial, force: :cascade do |t|
    t.string "header", null: false
    t.text "text"
    t.datetime "last_modified", precision: nil
  end

  create_table "cmses", primary_key: ["pagename", "language", "location", "type"], force: :cascade do |t|
    t.text "pagename", null: false
    t.text "language", null: false
    t.text "location", null: false
    t.text "type", null: false
    t.text "value", null: false
    t.datetime "last_modified_date", precision: nil
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

  create_table "mental_services", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.text "text"
    t.datetime "last_modified", precision: nil
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

  create_table "treatment_approaches", id: :serial, force: :cascade do |t|
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
