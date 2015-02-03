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

ActiveRecord::Schema.define(version: 20150203042800) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", force: true do |t|
    t.string   "name",       null: false
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "actors", ["name"], name: "index_actors_on_name", using: :btree

  create_table "episodes", force: true do |t|
    t.date     "air_date",       null: false
    t.integer  "episode_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "host",           null: false
  end

  add_index "episodes", ["air_date"], name: "index_episodes_on_air_date", using: :btree
  add_index "episodes", ["host"], name: "index_episodes_on_host", using: :btree

  create_table "league_memberships", force: true do |t|
    t.integer  "member_id",  null: false
    t.integer  "league_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ord"
  end

  add_index "league_memberships", ["league_id"], name: "index_league_memberships_on_league_id", using: :btree
  add_index "league_memberships", ["member_id", "league_id"], name: "index_league_memberships_on_member_id_and_league_id", unique: true, using: :btree
  add_index "league_memberships", ["member_id"], name: "index_league_memberships_on_member_id", using: :btree

  create_table "leagues", force: true do |t|
    t.string   "name",                               null: false
    t.integer  "creator_id",                         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "locked",             default: false, null: false
    t.boolean  "drafting",           default: false, null: false
    t.integer  "drafting_direction", default: 1,     null: false
    t.integer  "current_drafter_id", default: 1,     null: false
  end

  add_index "leagues", ["creator_id"], name: "index_leagues_on_creator_id", using: :btree
  add_index "leagues", ["name"], name: "index_leagues_on_name", using: :btree

  create_table "scoring_types", force: true do |t|
    t.string   "description", null: false
    t.integer  "value",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "symbol"
  end

  create_table "scorings", force: true do |t|
    t.integer  "actor_id",        null: false
    t.integer  "scoring_type_id", null: false
    t.integer  "episode_id",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scorings", ["actor_id"], name: "index_scorings_on_actor_id", using: :btree
  add_index "scorings", ["episode_id"], name: "index_scorings_on_episode_id", using: :btree
  add_index "scorings", ["scoring_type_id"], name: "index_scorings_on_scoring_type_id", using: :btree

  create_table "team_memberships", force: true do |t|
    t.integer  "actor_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id",    null: false
  end

  add_index "team_memberships", ["actor_id"], name: "index_team_memberships_on_actor_id", using: :btree
  add_index "team_memberships", ["team_id", "actor_id"], name: "index_team_memberships_on_team_id_and_actor_id", unique: true, using: :btree
  add_index "team_memberships", ["team_id"], name: "index_team_memberships_on_team_id", using: :btree

  create_table "teams", force: true do |t|
    t.string   "name",                          null: false
    t.integer  "owner_id",                      null: false
    t.integer  "league_id",                     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "memberships_count", default: 0, null: false
  end

  add_index "teams", ["league_id"], name: "index_teams_on_league_id", using: :btree
  add_index "teams", ["name"], name: "index_teams_on_name", using: :btree
  add_index "teams", ["owner_id"], name: "index_teams_on_owner_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",                      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_hash",                 null: false
    t.string   "session_token",                 null: false
    t.boolean  "is_admin",      default: false, null: false
  end

  add_index "users", ["username"], name: "index_users_on_username", using: :btree

  create_table "writeups", force: true do |t|
    t.string   "title"
    t.text     "body",       null: false
    t.integer  "episode_id"
    t.integer  "author_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "writeups", ["author_id"], name: "index_writeups_on_author_id", using: :btree
  add_index "writeups", ["episode_id"], name: "index_writeups_on_episode_id", unique: true, using: :btree

end
