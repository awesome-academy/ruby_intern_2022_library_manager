class BookItem < ApplicationRecord
  enum :status, nice: 0, old: 1, damaged: 2
  enum :format, paper_back: 0, cover: 1

  belongs_to :book

  has_one :rack_location, dependent: :nullify

  has_many :book_lendings, dependent: :restrict_with_exception
  has_many :borrowers, class_name: Member.name, through: :book_lendings,
              foreign_key: :member_id
  has_many :lenders, class_name: Librarian.name, through: :book_lendings,
              foreign_key: :lender_id

  validates :bar_code, :format, :date_of_purchase, presence: true
  validates :price, numericality: {greater_than: validation.book.price.min}
end
