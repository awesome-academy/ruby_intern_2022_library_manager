class BookItem < ApplicationRecord
  enum :status, nice: 0, old: 1, damaged: 2

  belongs_to :book

  has_one :rack_location, dependent: :restrict_with_exception

  has_many :book_lendings, dependent: :restrict_with_exception
  has_many :borrowers, class_name: Member.name, through: :book_lendings,
              foreign_key: :member_id
  has_many :lenders, class_name: Librarian.name, through: :book_lendings,
              foreign_key: :lender_id
end