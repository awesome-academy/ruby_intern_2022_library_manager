# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
["librarians", "members", "library_cards", "authors", "publishers",
 "rack_locations", "books"].each do |table_name|
  table_name.classify.constantize.delete_all
end

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

Author.create!(
  name: "Dennis Ritchie",
  bio: "Dennis MacAlistair Ritchie (9 tháng 9 năm 1941 – 12 tháng 10 năm" \
        "2011) là một nhà khoa học máy tính người Mỹ nổi tiếng vì đã phát" \
        " triển C."
)

Author.create!(
  name: "Dennis Ritchie",
  bio: "Brian Wilson Kernighan (/ˈkɜːrnɪhæn/;[6] born 1942)[1] is a Canadian" \
        "computer scientist."
)

1..20.times do |i|
  p = Publisher.create!(
    name: "Prentice Hall #{i}",
    description: "Best American Publisher",
    contact: "0987654321",
    address_attributes: {
      street: "Abc",
      sub_district: "Abc",
      district: "Abc",
      city: "Abc",
    }
  )
end

1..100.times do |i|
  book = Book.create!(
    isbn: "13862138136",
    title: "The C Programming Language #{i}",
    language: "English",
    number_of_pages: 287,
    publication_date: Date.parse("1971-1-1"),
    status: :on_demand,
    subject: "computer",
    image_url: "https://product.hstatic.net/200000211451/product" \
                "/e4277744-b37e-40a1-9bf1-1239bc0ea211_f5ec61bfe1" \
                "8b4838a51536cd092d6b42_master.jpg",
    author_ids: [1,2],
    publisher_ids: [1]
  )
end
1..100.times do |a|
  RackLocation.create!(
    number: a,
    location_identifier: "Num #{a}"
  )
end

1..20.times do |a|
  r = RackLocation.find(a+1)
  BookItem.create!(
    bar_code: "23131313#{a}",
    is_reference_only: false,
    price: 100 + a,
    format: :paper_back,
    status: :nice,
    book_id: 1,
    date_of_purchase: Date.parse("2022-04-05"),
    rack_location: r
  )
end
