class Author < ApplicationRecord
  has_many :books, through: :books_authors
end
