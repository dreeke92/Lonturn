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

ActiveRecord::Schema.define(version: 2019_09_07_193259) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "currencies", force: :cascade do |t|
    t.string "name"
    t.string "ticker"
    t.float "value"
    t.float "volume"
  end

  create_table "currency_holdings", force: :cascade do |t|
    t.bigint "currency_id"
    t.bigint "investment_period_id"
    t.float "amount"
    t.float "percentage"
    t.float "money_value"
    t.index ["currency_id"], name: "index_currency_holdings_on_currency_id"
    t.index ["investment_period_id"], name: "index_currency_holdings_on_investment_period_id"
  end

  create_table "currency_trades", force: :cascade do |t|
    t.bigint "investment_period_id"
    t.bigint "debet_currency_id"
    t.bigint "credit_currency_id"
    t.float "debet_amount"
    t.float "credit_amount"
    t.date "date"
    t.index ["credit_currency_id"], name: "index_currency_trades_on_credit_currency_id"
    t.index ["debet_currency_id"], name: "index_currency_trades_on_debet_currency_id"
    t.index ["investment_period_id"], name: "index_currency_trades_on_investment_period_id"
  end

  create_table "investment_periods", force: :cascade do |t|
    t.integer "period_number"
    t.date "start_date"
    t.date "end_date"
    t.float "start_value"
    t.float "end_value"
  end

  create_table "user_commitments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "investment_period_id"
    t.float "amount"
    t.string "status"
    t.index ["investment_period_id"], name: "index_user_commitments_on_investment_period_id"
    t.index ["user_id"], name: "index_user_commitments_on_user_id"
  end

  create_table "user_investments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "investment_period_id"
    t.float "equity_value"
    t.float "equity_percentage"
    t.float "high_water_mark"
    t.index ["investment_period_id"], name: "index_user_investments_on_investment_period_id"
    t.index ["user_id"], name: "index_user_investments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "second_name"
    t.string "full_name"
    t.string "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "currency_holdings", "currencies"
  add_foreign_key "currency_holdings", "investment_periods"
  add_foreign_key "currency_trades", "investment_periods"
  add_foreign_key "user_commitments", "investment_periods"
  add_foreign_key "user_commitments", "users"
  add_foreign_key "user_investments", "investment_periods"
  add_foreign_key "user_investments", "users"
end
