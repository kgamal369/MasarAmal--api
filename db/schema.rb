# frozen_string_literal: true

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

ActiveRecord::Schema[7.1].define(version: 20_240_106_070_038) do
  create_schema 'masar'

  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_admin_comments', force: :cascade do |t|
    t.string 'namespace'
    t.text 'body'
    t.string 'resource_type'
    t.bigint 'resource_id'
    t.string 'author_type'
    t.bigint 'author_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[author_type author_id], name: 'index_active_admin_comments_on_author'
    t.index ['namespace'], name: 'index_active_admin_comments_on_namespace'
    t.index %w[resource_type resource_id], name: 'index_active_admin_comments_on_resource'
  end

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum'
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', force: :cascade do |t|
    t.bigint 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'admin_users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_admin_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_admin_users_on_reset_password_token', unique: true
  end

  create_table 'blog_posts', id: :serial, force: :cascade do |t|
    t.string 'header', null: false
    t.text 'text'
    t.datetime 'last_modified', precision: nil
  end

  create_table 'cms_components', primary_key: 'componentid', id: :serial, force: :cascade do |t|
    t.string 'componentname', limit: 255, null: false
    t.string 'componenttype', limit: 255, null: false
  end

  create_table 'cms_languages', primary_key: 'languageid', id: :serial, force: :cascade do |t|
    t.string 'languagename', limit: 255, null: false
  end

  create_table 'cms_page_sections', primary_key: 'pagesectionid', id: :serial, force: :cascade do |t|
    t.integer 'pageid'
    t.integer 'sectionid'

    t.unique_constraint %w[pageid sectionid], name: 'cms_page_sections_pageid_sectionid_key'
  end

  create_table 'cms_pages', primary_key: 'pageid', id: :serial, force: :cascade do |t|
    t.string 'pagename', limit: 255, null: false
  end

  create_table 'cms_section_components', primary_key: 'sectioncomponentid', id: :serial, force: :cascade do |t|
    t.integer 'sectionid'
    t.integer 'componentid'

    t.unique_constraint %w[sectionid componentid], name: 'cms_section_components_sectionid_componentid_key'
  end

  create_table 'cms_sections', primary_key: 'sectionid', id: :serial, force: :cascade do |t|
    t.string 'sectionname', limit: 255, null: false
  end

  create_table 'cms_values', primary_key: 'cmsvalueid', id: :serial, force: :cascade do |t|
    t.integer 'pagesectionid'
    t.integer 'sectioncomponentid'
    t.integer 'languageid'
    t.text 'value', null: false
  end

  create_table 'cmses', primary_key: %w[pagename language location type], force: :cascade do |t|
    t.text 'pagename', null: false
    t.text 'language', null: false
    t.text 'location', null: false
    t.text 'type', null: false
    t.text 'value', null: false
    t.datetime 'last_modified_date', precision: nil
  end

  create_table 'components', force: :cascade do |t|
    t.string 'name'
    t.string 'componenttype'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'doctors', id: :serial, force: :cascade do |t|
    t.string 'name', null: false
    t.text 'text'
    t.string 'pictures'
    t.datetime 'last_modified', precision: nil
  end

  create_table 'facilities', id: :serial, force: :cascade do |t|
    t.string 'name', null: false
    t.text 'text'
    t.string 'pictures'
    t.datetime 'last_modified', precision: nil
  end

  create_table 'languages', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'mental_services', id: :serial, force: :cascade do |t|
    t.string 'name', null: false
    t.text 'text'
    t.datetime 'last_modified', precision: nil
  end

  create_table 'news_events', id: :serial, force: :cascade do |t|
    t.string 'header', null: false
    t.text 'text'
    t.date 'date_of_events'
    t.datetime 'last_modified', precision: nil
  end

  create_table 'page_sections', force: :cascade do |t|
    t.bigint 'page_id', null: false
    t.bigint 'section_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['page_id'], name: 'index_page_sections_on_page_id'
    t.index ['section_id'], name: 'index_page_sections_on_section_id'
  end

  create_table 'pages', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'roles', primary_key: 'role_id', id: :serial, force: :cascade do |t|
    t.string 'role_name', null: false

    t.unique_constraint ['role_name'], name: 'roles_role_name_key'
  end

  create_table 'section_components', force: :cascade do |t|
    t.bigint 'section_id', null: false
    t.bigint 'component_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['component_id'], name: 'index_section_components_on_component_id'
    t.index ['section_id'], name: 'index_section_components_on_section_id'
  end

  create_table 'sections', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'treatment_approaches', id: :serial, force: :cascade do |t|
    t.string 'name', null: false
    t.text 'text'
    t.datetime 'last_modified', precision: nil
  end

  create_table 'user_roles', primary_key: %w[user_id role_id], force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'role_id', null: false
  end

  create_table 'users', primary_key: 'user_id', id: :serial, force: :cascade do |t|
    t.string 'username', null: false
    t.string 'password', null: false
    t.string 'email', null: false
    t.string 'full_name'
    t.datetime 'registration_date', precision: nil, default: -> { 'CURRENT_TIMESTAMP' }
    t.datetime 'last_login', precision: nil

    t.unique_constraint ['email'], name: 'users_email_key'
    t.unique_constraint ['username'], name: 'users_username_key'
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'cms_page_sections', 'cms_pages', column: 'pageid', primary_key: 'pageid',
                                                    name: 'cms_page_sections_pageid_fkey', on_delete: :cascade
  add_foreign_key 'cms_page_sections', 'cms_sections', column: 'sectionid', primary_key: 'sectionid',
                                                       name: 'cms_page_sections_sectionid_fkey', on_delete: :cascade
  add_foreign_key 'cms_section_components', 'cms_components', column: 'componentid', primary_key: 'componentid',
                                                              name: 'cms_section_components_componentid_fkey', on_delete: :cascade
  add_foreign_key 'cms_section_components', 'cms_sections', column: 'sectionid', primary_key: 'sectionid',
                                                            name: 'cms_section_components_sectionid_fkey', on_delete: :cascade
  add_foreign_key 'cms_values', 'cms_languages', column: 'languageid', primary_key: 'languageid',
                                                 name: 'cms_values_languageid_fkey', on_delete: :cascade
  add_foreign_key 'cms_values', 'cms_page_sections', column: 'pagesectionid', primary_key: 'pagesectionid',
                                                     name: 'cms_values_pagesectionid_fkey', on_delete: :cascade
  add_foreign_key 'cms_values', 'cms_section_components', column: 'sectioncomponentid',
                                                          primary_key: 'sectioncomponentid', name: 'cms_values_sectioncomponentid_fkey', on_delete: :cascade
  add_foreign_key 'page_sections', 'pages'
  add_foreign_key 'page_sections', 'sections'
  add_foreign_key 'section_components', 'components'
  add_foreign_key 'section_components', 'sections'
  add_foreign_key 'user_roles', 'roles', primary_key: 'role_id', name: 'user_roles_role_id_fkey'
  add_foreign_key 'user_roles', 'users', primary_key: 'user_id', name: 'user_roles_user_id_fkey'
end
