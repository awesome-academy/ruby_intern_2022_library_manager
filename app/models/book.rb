class Book < ApplicationRecord
  enum :status, on_demand: 0, suspension: 1, comming_soon: 2
  enum :subject, literature: 0, math: 1, computer: 2

  has_many :books_publishers, dependent: :delete_all
  has_many :books_authors, dependent: :delete_all
  has_many :publishers, through: :books_publishers
  has_many :authors, through: :books_authors
  has_many :book_items, dependent: :restrict_with_exception
  has_many :book_reservations, dependent: :restrict_with_exception
  has_many :members, through: :book_reservations
  has_many :book_freezings, dependent: :restrict_with_exception
  has_many :advanced_members, through: :book_freezings
  has_many :review, dependent: :restrict_with_exception
end
