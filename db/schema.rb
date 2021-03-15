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

ActiveRecord::Schema.define(version: 2021_03_15_012723) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.bigint "home_id"
    t.bigint "away_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["away_id"], name: "index_games_on_away_id"
    t.index ["home_id"], name: "index_games_on_home_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "position"
    t.string "status"
    t.integer "jersey_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stats", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "team_id"
    t.bigint "game_id"
    t.integer "inning"
    t.integer "hit"
    t.integer "k"
    t.integer "bb"
    t.integer "rbi"
    t.integer "runs"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_stats_on_game_id"
    t.index ["player_id"], name: "index_stats_on_player_id"
    t.index ["team_id"], name: "index_stats_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "mlb_team_id"
    t.boolean "custom_team"
    t.bigint "C_id"
    t.bigint "B1_id"
    t.bigint "B2_id"
    t.bigint "B3_id"
    t.bigint "SS_id"
    t.bigint "OF1_id"
    t.bigint "OF2_id"
    t.bigint "OF3_id"
    t.bigint "DH_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "uid"
    t.string "fav_team_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "games", "teams", column: "away_id"
  add_foreign_key "games", "teams", column: "home_id"
  add_foreign_key "teams", "players", column: "B1_id"
  add_foreign_key "teams", "players", column: "B2_id"
  add_foreign_key "teams", "players", column: "B3_id"
  add_foreign_key "teams", "players", column: "C_id"
  add_foreign_key "teams", "players", column: "DH_id"
  add_foreign_key "teams", "players", column: "OF1_id"
  add_foreign_key "teams", "players", column: "OF2_id"
  add_foreign_key "teams", "players", column: "OF3_id"
  add_foreign_key "teams", "players", column: "SS_id"
end
