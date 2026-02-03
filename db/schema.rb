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

ActiveRecord::Schema[7.2].define(version: 2026_02_03_011333) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "g_leiloes", force: :cascade do |t|
    t.string "titulo"
    t.string "codigo"
    t.date "data_inicio_prevista"
    t.date "data_termino_prevista"
    t.text "observacoes"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_g_leiloes_on_deleted_at"
  end

  create_table "g_tipos_veiculos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_g_tipos_veiculos_on_deleted_at"
  end

  create_table "g_veiculos", force: :cascade do |t|
    t.string "numero_interno"
    t.string "placa"
    t.string "chassi"
    t.string "renavam"
    t.string "marca"
    t.string "modelo"
    t.integer "ano"
    t.string "cor"
    t.string "motor"
    t.bigint "g_tipo_veiculo_id", null: false
    t.string "tombamento"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "apto", default: false, null: false
    t.string "status", default: "pendente", null: false
    t.index ["deleted_at"], name: "index_g_veiculos_on_deleted_at"
    t.index ["g_tipo_veiculo_id"], name: "index_g_veiculos_on_g_tipo_veiculo_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "cpf"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "g_veiculos", "g_tipos_veiculos"
end
