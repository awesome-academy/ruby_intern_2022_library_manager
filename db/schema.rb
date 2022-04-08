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

ActiveRecord::Schema[7.0].define(version: 2022_04_12_015758) do
  create_table "accounts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "username", null: false
    t.string "password_digest", null: false
    t.integer "status", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.date "date_of_birth", null: false
    t.string "email", null: false
    t.string "remember_digest"
    t.boolean "activated", null: false
    t.datetime "activated_at"
    t.string "activation_digest"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.string "phone_number", null: false
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "start_date"
    t.date "end_date"
    t.boolean "super_admin"
    t.integer "membership_status"
    t.string "card_code"
    t.date "expiration_date"
    t.integer "academic_rank"
    t.integer "academic_degree"
    t.string "unit"
    t.string "role"
  end

  create_table "addresses", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "street", null: false
    t.string "sub_district", null: false
    t.string "district", null: false
    t.string "city", null: false
    t.bigint "locatable_id"
    t.string "locatable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authors", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "bio", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_freezings", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "status", null: false
    t.string "note", null: false
    t.integer "number_to_free", null: false
    t.bigint "book_id", null: false
    t.bigint "advanced_member_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advanced_member_id"], name: "index_book_freezings_on_advanced_member_id"
    t.index ["book_id", "advanced_member_id"], name: "index_book_freezings_on_book_id_and_advanced_member_id", unique: true
    t.index ["book_id"], name: "index_book_freezings_on_book_id"
  end

  create_table "book_items", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "bar_code", null: false
    t.boolean "is_reference_only", null: false
    t.decimal "price", precision: 10, null: false
    t.integer "format", null: false
    t.integer "status", null: false
    t.date "date_of_purchase", null: false
    t.bigint "book_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_items_on_book_id"
  end

  create_table "book_lendings", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "due_date", null: false
    t.integer "book_status", null: false
    t.bigint "member_id", null: false
    t.bigint "lender_id", null: false
    t.bigint "reservation_id"
    t.bigint "book_item_id", null: false
    t.index ["book_item_id"], name: "index_book_lendings_on_book_item_id"
    t.index ["lender_id"], name: "index_book_lendings_on_lender_id"
    t.index ["member_id"], name: "index_book_lendings_on_member_id"
    t.index ["reservation_id"], name: "index_book_lendings_on_reservation_id"
  end

  create_table "book_reservations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.string "note"
    t.datetime "reserve_date"
    t.bigint "book_id", null: false
    t.bigint "member_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_reservations_on_book_id"
    t.index ["member_id"], name: "index_book_reservations_on_member_id"
  end

  create_table "book_returns", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "book_status", null: false
    t.bigint "recipient_id", null: false
    t.bigint "book_lending_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_lending_id"], name: "index_book_returns_on_book_lending_id"
    t.index ["recipient_id"], name: "index_book_returns_on_recipient_id"
  end

  create_table "books", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "isbn", null: false
    t.string "title", null: false
    t.integer "subject", null: false
    t.string "language", null: false
    t.integer "number_of_pages", null: false
    t.date "publication_date", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
  end

  create_table "books_authors", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_books_authors_on_author_id"
    t.index ["book_id"], name: "index_books_authors_on_book_id"
  end

  create_table "books_publishers", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "publisher_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_books_publishers_on_book_id"
    t.index ["publisher_id"], name: "index_books_publishers_on_publisher_id"
  end

  create_table "fine_transactions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.decimal "amount", precision: 10, null: false
    t.string "type", null: false
    t.bigint "fine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "bank_name"
    t.string "check_number"
    t.string "card_number"
    t.string "card_holder"
    t.datetime "expiration_date"
    t.decimal "cash_tendered", precision: 10
    t.index ["fine_id"], name: "index_fine_transactions_on_fine_id"
  end

  create_table "fines", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.decimal "amount", precision: 10, null: false
    t.bigint "book_return_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_return_id"], name: "index_fines_on_book_return_id", unique: true
  end

  create_table "library_cards", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "card_code", null: false
    t.string "bar_code", null: false
    t.date "issued_at", null: false
    t.bigint "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_library_cards_on_member_id", unique: true
  end

  create_table "publishers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.string "contact", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rack_locations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "number", null: false
    t.string "location_identifier", null: false
    t.bigint "book_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_item_id"], name: "index_rack_locations_on_book_item_id"
  end

  create_table "reviews", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "content", null: false
    t.integer "score", null: false
    t.bigint "member_id", null: false
    t.bigint "book_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_reviews_on_book_id"
    t.index ["member_id"], name: "index_reviews_on_member_id"
  end

  add_foreign_key "book_freezings", "accounts", column: "advanced_member_id"
  add_foreign_key "book_freezings", "books"
  add_foreign_key "book_items", "books"
  add_foreign_key "book_lendings", "accounts", column: "lender_id"
  add_foreign_key "book_lendings", "accounts", column: "member_id"
  add_foreign_key "book_lendings", "book_items"
  add_foreign_key "book_lendings", "book_reservations", column: "reservation_id"
  add_foreign_key "book_reservations", "accounts", column: "member_id"
  add_foreign_key "book_reservations", "books"
  add_foreign_key "book_returns", "accounts", column: "recipient_id"
  add_foreign_key "book_returns", "book_lendings"
  add_foreign_key "books_authors", "authors"
  add_foreign_key "books_authors", "books"
  add_foreign_key "books_publishers", "books"
  add_foreign_key "books_publishers", "publishers"
  add_foreign_key "fine_transactions", "fines"
  add_foreign_key "fines", "book_returns"
  add_foreign_key "library_cards", "accounts", column: "member_id"
  add_foreign_key "rack_locations", "book_items"
  add_foreign_key "reviews", "accounts", column: "member_id"
  add_foreign_key "reviews", "books"
end
