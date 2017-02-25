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

ActiveRecord::Schema.define(version: 20170221134949) do

  create_table "deposit_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "name",       default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "deposits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "deposit_category_id",                         null: false
    t.integer  "member_id",                                   null: false
    t.decimal  "amount",              precision: 8, scale: 2, null: false
    t.string   "info"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.index ["deposit_category_id"], name: "index_deposits_on_deposit_category_id", using: :btree
    t.index ["member_id"], name: "index_deposits_on_member_id", using: :btree
  end

  create_table "interests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "type",                   null: false
    t.integer  "rate",       default: 1, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "loan_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "name",       default: 0, null: false
    t.integer  "term",       default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "loans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "loan_type_id",                                     null: false
    t.integer  "member_id",                                        null: false
    t.decimal  "amount",       precision: 8, scale: 2,             null: false
    t.datetime "accorded_at",                                      null: false
    t.datetime "loan_at",                                          null: false
    t.date     "paid_off_at",                                      null: false
    t.integer  "info",                                 default: 0, null: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.index ["loan_type_id"], name: "index_loans_on_loan_type_id", using: :btree
    t.index ["member_id"], name: "index_loans_on_member_id", using: :btree
  end

  create_table "members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "official_id",                            null: false
    t.string   "name",                                   null: false
    t.text     "address",      limit: 65535,             null: false
    t.string   "birthplace",                             null: false
    t.date     "birthdate",                              null: false
    t.string   "phone_number",                           null: false
    t.integer  "status",                     default: 0, null: false
    t.integer  "gender",                     default: 0, null: false
    t.string   "info"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["official_id"], name: "index_members_on_official_id", using: :btree
  end

  create_table "officials", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "username",                             default: "", null: false
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name",                                              null: false
    t.text     "address",                limit: 65535,              null: false
    t.string   "birthplace",                                        null: false
    t.date     "birthdate",                                         null: false
    t.string   "phone_number",                                      null: false
    t.string   "info"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.index ["email"], name: "index_officials_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_officials_on_reset_password_token", unique: true, using: :btree
    t.index ["username"], name: "index_officials_on_username", unique: true, using: :btree
  end

  create_table "payment_schedules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "payment_id",                         null: false
    t.decimal  "amount",     precision: 8, scale: 2, null: false
    t.string   "sequence",                           null: false
    t.string   "info"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["payment_id"], name: "index_payment_schedules_on_payment_id", using: :btree
  end

  create_table "payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "loan_id",                            null: false
    t.decimal  "total",      precision: 8, scale: 2, null: false
    t.string   "due_date",                           null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["loan_id"], name: "index_payments_on_loan_id", using: :btree
  end

end
