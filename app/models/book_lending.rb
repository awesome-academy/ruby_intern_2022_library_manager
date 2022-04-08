class BookLending < ApplicationRecord
  enum :book_status, normal: 0, nice: 1, old: 2, damaged: 3

  belongs_to :lender, class_name: Librarian.name, foreign_key: :lender_id
  belongs_to :borrower, class_name: Member.name, foreign_key: :member_id
  belongs_to :reservation, class_name: BookReservation.name
  belongs_to :book_item
end
