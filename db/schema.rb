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

ActiveRecord::Schema.define(version: 20191012170539) do

  create_table "associacao", force: :cascade do |t|
    t.integer "classe_id"
    t.integer "classe_destino"
    t.integer "tipo_associacao", default: 0
    t.string "multi_a"
    t.string "multi_b"
    t.string "estereotipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classe_id"], name: "index_associacao_on_classe_id"
  end

  create_table "atributo", force: :cascade do |t|
    t.integer "classe_id"
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classe_id"], name: "index_atributo_on_classe_id"
  end

  create_table "classe", force: :cascade do |t|
    t.integer "diagrama_id"
    t.string "nome"
    t.string "estereotipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diagrama_id"], name: "index_classe_on_diagrama_id"
  end

  create_table "diagrama", force: :cascade do |t|
    t.integer "user_id"
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_diagrama_on_user_id"
  end

  create_table "metodo", force: :cascade do |t|
    t.integer "classe_id"
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classe_id"], name: "index_metodo_on_classe_id"
  end

  create_table "user", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reset_password_token"], name: "index_user_on_reset_password_token", unique: true
    t.index ["username"], name: "index_user_on_username", unique: true
  end

end
