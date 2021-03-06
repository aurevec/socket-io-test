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

ActiveRecord::Schema.define(version: 20131215214941) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "competitions", force: true do |t|
    t.string   "name",       null: false
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "competitions", ["country_id"], name: "index_competitions_on_country_id", using: :btree

  create_table "countries", force: true do |t|
    t.string   "name",       null: false
    t.string   "iso_code",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "days", force: true do |t|
    t.integer  "number"
    t.integer  "season_id",  null: false
    t.date     "begin_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "days", ["season_id"], name: "index_days_on_season_id", using: :btree

  create_table "entries", force: true do |t|
    t.integer  "team_id"
    t.integer  "season_id"
    t.integer  "handicap",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entries", ["season_id"], name: "index_entries_on_season_id", using: :btree
  add_index "entries", ["team_id"], name: "index_entries_on_team_id", using: :btree

  create_table "matches", force: true do |t|
    t.integer  "day_id"
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.integer  "home_goals"
    t.integer  "away_goals"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "matches", ["away_team_id"], name: "index_matches_on_away_team_id", using: :btree
  add_index "matches", ["day_id"], name: "index_matches_on_day_id", using: :btree
  add_index "matches", ["home_team_id"], name: "index_matches_on_home_team_id", using: :btree

  create_table "seasons", force: true do |t|
    t.integer  "competition_id",             null: false
    t.integer  "year_id",                    null: false
    t.date     "begin_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "win_points",     default: 0
    t.integer  "draw_points",    default: 0
    t.integer  "defeat_points",  default: 0
  end

  add_index "seasons", ["competition_id"], name: "index_seasons_on_competition_id", using: :btree
  add_index "seasons", ["year_id"], name: "index_seasons_on_year_id", using: :btree

  create_table "teams", force: true do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["country_id"], name: "index_teams_on_country_id", using: :btree

  create_table "years", force: true do |t|
    t.string   "name",       null: false
    t.date     "begin_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "competitions", "countries", name: "competitions_country_id_fk"

  add_foreign_key "days", "seasons", name: "days_season_id_fk"

  add_foreign_key "entries", "seasons", name: "participations_season_id_fk"
  add_foreign_key "entries", "teams", name: "participations_team_id_fk"

  add_foreign_key "matches", "days", name: "matches_day_id_fk"
  add_foreign_key "matches", "teams", name: "matches_away_team_id_fk", column: "away_team_id"
  add_foreign_key "matches", "teams", name: "matches_home_team_id_fk", column: "home_team_id"

  add_foreign_key "seasons", "competitions", name: "seasons_competition_id_fk"
  add_foreign_key "seasons", "years", name: "seasons_year_id_fk"

  add_foreign_key "teams", "countries", name: "teams_country_id_fk"

end
