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

ActiveRecord::Schema.define(version: 20171219155049) do

  create_table "answers", force: :cascade do |t|
    t.string "drop_down_items"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "questions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "responses", force: :cascade do |t|
    t.integer "question_id"
    t.integer "user_id"
    t.integer "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_responses_on_answer_id"
    t.index ["question_id"], name: "index_responses_on_question_id"
    t.index ["user_id"], name: "index_responses_on_user_id"
  end

  create_table "to_buy_lists", force: :cascade do |t|
    t.string "book_title"
    t.string "author"
    t.string "cover_photo"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_to_buy_lists_on_user_id"
  end

  create_table "user_books", force: :cascade do |t|
    t.string "book_title"
    t.string "cover_photo"
    t.string "author"
    t.string "description"
    t.string "tags"
    t.string "rating"
    t.boolean "has_read"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "to_buy"
    t.index ["user_id"], name: "index_user_books_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.boolean "admin"
    t.string "first_name"
    t.string "last_name"
    t.string "grade_level"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
