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

ActiveRecord::Schema.define(version: 20180420095842) do

  create_table "alliances", force: :cascade do |t|
    t.text "commentary"
    t.string "confirm"
    t.integer "approval_id"
    t.integer "applicant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_id"], name: "index_alliances_on_applicant_id"
    t.index ["approval_id"], name: "index_alliances_on_approval_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.integer "inventory"
    t.integer "user_id"
    t.integer "classification_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classification_id"], name: "index_articles_on_classification_id"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "authentications", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_authentications_on_authentication_token", unique: true
    t.index ["email"], name: "index_authentications_on_email", unique: true
    t.index ["reset_password_token"], name: "index_authentications_on_reset_password_token", unique: true
  end

  create_table "classifications", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "messages", force: :cascade do |t|
    t.string "topic"
    t.text "content"
    t.date "date"
    t.integer "sender_id"
    t.integer "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_messages_on_receiver_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "photos", force: :cascade do |t|
    t.date "date"
    t.binary "photo"
    t.integer "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photos"
    t.index ["article_id"], name: "index_photos_on_article_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "question"
    t.text "answer"
    t.date "date"
    t.integer "user_id"
    t.integer "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_questions_on_article_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "sales", force: :cascade do |t|
    t.date "date"
    t.integer "quantity"
    t.decimal "amount"
    t.integer "seller_id"
    t.integer "buyer_id"
    t.integer "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_sales_on_article_id"
    t.index ["buyer_id"], name: "index_sales_on_buyer_id"
    t.index ["seller_id"], name: "index_sales_on_seller_id"
  end

  create_table "scores", force: :cascade do |t|
    t.text "commentary"
    t.integer "score"
    t.integer "sale_id"
    t.integer "qualified_id"
    t.integer "qualifier_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["qualified_id"], name: "index_scores_on_qualified_id"
    t.index ["qualifier_id"], name: "index_scores_on_qualifier_id"
    t.index ["sale_id"], name: "index_scores_on_sale_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "typeuser"
    t.string "iddocument"
    t.string "typedocument"
    t.string "email"
    t.string "phone"
    t.decimal "latitude"
    t.decimal "langitude"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "lastname"
  end

end
