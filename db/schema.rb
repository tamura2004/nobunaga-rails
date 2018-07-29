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

ActiveRecord::Schema.define(version: 2018_07_29_102916) do

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "boards", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "castles", force: :cascade do |t|
    t.string "country"
    t.integer "area_id"
    t.string "name"
    t.string "ability"
    t.string "image"
    t.integer "order"
    t.string "owner_type"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_castles_on_area_id"
    t.index ["owner_type", "owner_id"], name: "index_castles_on_owner_type_and_owner_id"
  end

  create_table "dices", force: :cascade do |t|
    t.integer "number"
    t.string "color"
    t.string "owner_type"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_type", "owner_id"], name: "index_dices_on_owner_type_and_owner_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer "players_number"
    t.integer "turn"
    t.string "step"
    t.integer "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_games_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.integer "number"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ranks", force: :cascade do |t|
    t.string "name"
    t.integer "vp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "samurais", force: :cascade do |t|
    t.string "name"
    t.integer "vp"
    t.string "ability"
    t.string "value"
    t.integer "order"
    t.string "owner_type"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_type", "owner_id"], name: "index_samurais_on_owner_type_and_owner_id"
  end

end
