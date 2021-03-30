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

ActiveRecord::Schema.define(version: 2021_03_26_013503) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.bigint "mlb_team_id"
    t.bigint "user_id"
    t.bigint "lineup_id"
    t.boolean "home"
    t.string "matchup"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lineup_id"], name: "index_games_on_lineup_id"
    t.index ["mlb_team_id"], name: "index_games_on_mlb_team_id"
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "lineup_players", force: :cascade do |t|
    t.string "position"
    t.bigint "mlb_player_id"
    t.bigint "lineup_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "dh", default: false
    t.index ["lineup_id"], name: "index_lineup_players_on_lineup_id"
    t.index ["mlb_player_id"], name: "index_lineup_players_on_mlb_player_id"
  end

  create_table "lineups", force: :cascade do |t|
    t.bigint "mlb_team_id"
    t.bigint "user_id"
    t.string "season"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mlb_team_id"], name: "index_lineups_on_mlb_team_id"
    t.index ["user_id"], name: "index_lineups_on_user_id"
  end

  create_table "mlb_players", force: :cascade do |t|
    t.string "position_txt"
    t.integer "position_num"
    t.string "jersey_number"
    t.string "first_name"
    t.string "last_name"
    t.string "name_display_first_last"
    t.string "bats"
    t.string "throws"
    t.datetime "debut_date"
    t.string "status"
    t.datetime "birth_date"
    t.string "weight"
    t.string "height_feet"
    t.string "height_inches"
    t.bigint "mlb_team_id"
    t.string "headshot"
    t.string "image_action"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mlb_team_id"], name: "index_mlb_players_on_mlb_team_id"
  end

  create_table "mlb_teams", force: :cascade do |t|
    t.string "name"
    t.string "name_full"
    t.string "venue"
    t.string "city"
    t.string "state"
    t.string "division"
    t.string "league"
    t.string "logo"
    t.string "color1"
    t.string "color2"
    t.string "website"
    t.string "timezone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stats", force: :cascade do |t|
    t.bigint "mlb_player_id"
    t.bigint "mlb_team_id"
    t.bigint "game_id"
    t.bigint "lineup_id"
    t.integer "inning"
    t.integer "hit"
    t.integer "k"
    t.integer "bb"
    t.integer "rbi"
    t.integer "runs"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_stats_on_game_id"
    t.index ["lineup_id"], name: "index_stats_on_lineup_id"
    t.index ["mlb_player_id"], name: "index_stats_on_mlb_player_id"
    t.index ["mlb_team_id"], name: "index_stats_on_mlb_team_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name_first"
    t.string "name_last"
    t.bigint "mlb_team_id"
    t.string "password_digest"
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mlb_team_id"], name: "index_users_on_mlb_team_id"
  end

end
