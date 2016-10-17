# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161016211200) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "beneficiaries", force: :cascade do |t|
    t.text   "name",   limit: 65535, null: false
    t.string "city",   limit: 255
    t.string "region", limit: 255
    t.string "county", limit: 255
    t.string "code",   limit: 20
  end

  create_table "contracts", force: :cascade do |t|
    t.decimal "OP",                              precision: 20
    t.string  "PA",                limit: 11
    t.string  "KAI",               limit: 255
    t.string  "oper",              limit: 255
    t.integer "smis_code",         limit: 4
    t.integer "ver",               limit: 4
    t.integer "subproj",           limit: 4
    t.integer "contr_no",          limit: 4
    t.string  "status",            limit: 255
    t.text    "title",             limit: 65535
    t.string  "start_date",        limit: 255
    t.string  "end_date",          limit: 255
    t.string  "contr_value",       limit: 255
    t.string  "commitment_type",   limit: 255
    t.string  "cnp",               limit: 255
    t.string  "contractor_name",   limit: 255,                  default: "",    null: false
    t.boolean "checked",                                        default: false
    t.string  "contract_type",     limit: 255
    t.string  "procedure_type",    limit: 255
    t.string  "seap_publish_date", limit: 255
    t.integer "beneficiary_id",    limit: 4
  end

  add_index "contracts", ["beneficiary_id"], name: "fk_contract_beneficiary", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "contracts", "beneficiaries", name: "fk_contract_beneficiary"
end
