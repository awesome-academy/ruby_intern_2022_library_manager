# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Librarian.delete_all
LibraryCard.delete_all
Member.delete_all
Librarian.create!(
  username: "admin", password: "123456", password_confirmation: "123456",
  status: :normal, first_name: "Foo", last_name: "Bar",
  date_of_birth: Date.parse("2000-07-26"),
  email: "admin@gmail.com", activated: true, phone_number: "0987654321",
  start_date: Date.parse("2020-06-07"), super_admin: true
)

m = Member.create!(
  username: "member", password: "123456", password_confirmation: "123456",
  status: :normal, first_name: "First", last_name: "Member",
  date_of_birth: Date.parse("2000-07-26"),
  email: "member@gmail.com", activated: true, phone_number: "0987654321",
  membership_status: :on, card_code: "09898320913",
  expiration_date: Date.parse("2050-12-31")
)

m.build_library_card(
  card_code: "04320000988", bar_code: "09218383389371",
  issued_at: Date.parse("1998-01-01")
)
