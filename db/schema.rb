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

ActiveRecord::Schema[7.0].define(version: 2024_01_18_092758) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "agendas", force: :cascade do |t|
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tipoevento"
    t.integer "tipoparticipanteconvite"
  end

  create_table "arquivos", force: :cascade do |t|
    t.integer "idobjeto"
    t.integer "tipoobjeto"
    t.integer "status"
    t.string "name"
    t.string "url"
    t.integer "tipoarquivo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "empresas", force: :cascade do |t|
    t.bigint "plano_id", null: false
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "razaosocial"
    t.string "cnpj"
    t.string "nomefantasia"
    t.index ["plano_id"], name: "index_empresas_on_plano_id"
  end

  create_table "equipes", force: :cascade do |t|
    t.string "name"
    t.bigint "empresa_id", null: false
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empresa_id"], name: "index_equipes_on_empresa_id"
  end

  create_table "eventos", force: :cascade do |t|
    t.integer "idobjeto"
    t.integer "tipoobjeto"
    t.integer "status"
    t.boolean "enviarparaparticipante"
    t.date "datainicio"
    t.date "datafim"
    t.time "horainicio"
    t.time "horafim"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "duration"
    t.string "name"
    t.string "descricao"
    t.string "linkevento"
    t.string "descricaocurta"
    t.integer "tipoparticipanteconvite"
    t.string "idcalendar"
  end

  create_table "eventosusers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "evento_id"
    t.string "idcalendaruser"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tipoobjeto"
  end

  create_table "icps", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loginternos", force: :cascade do |t|
    t.date "data"
    t.datetime "hora"
    t.time "datahora"
    t.string "funcao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "permissuser"
    t.bigint "adminuserid"
  end

  create_table "planos", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programasetorials", force: :cascade do |t|
    t.string "name"
    t.string "descricao"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ano"
    t.string "empresa"
    t.string "parceiro"
    t.string "quantempresas"
    t.string "quantengajamento"
    t.string "quantinscricoes"
    t.string "descricaocurta"
  end

  create_table "programasusers", force: :cascade do |t|
    t.bigint "programasetorial_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["programasetorial_id"], name: "index_programasusers_on_programasetorial_id"
    t.index ["user_id"], name: "index_programasusers_on_user_id"
  end

  create_table "timelines", force: :cascade do |t|
    t.integer "idobjeto"
    t.integer "tipoobjeto"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "userequipes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "empresa_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empresa_id"], name: "index_userequipes_on_empresa_id"
    t.index ["user_id"], name: "index_userequipes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "cpf"
    t.date "birthdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.bigint "plano_id"
    t.integer "status"
    t.bigint "icp_id"
    t.boolean "newsletter"
    t.bigint "empresa_id"
    t.date "dataprimeirologin"
    t.boolean "primeirologin"
    t.integer "countlogin"
    t.date "ultimologin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["empresa_id"], name: "index_users_on_empresa_id"
    t.index ["icp_id"], name: "index_users_on_icp_id"
    t.index ["plano_id"], name: "index_users_on_plano_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "empresas", "planos"
  add_foreign_key "equipes", "empresas"
  add_foreign_key "programasusers", "programasetorials"
  add_foreign_key "programasusers", "users"
  add_foreign_key "userequipes", "empresas"
  add_foreign_key "userequipes", "users"
  add_foreign_key "users", "empresas"
  add_foreign_key "users", "icps"
  add_foreign_key "users", "planos"
end
