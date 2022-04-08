class BooksPublisher < ApplicationRecord
  belongs_to :book
  belongs_to :publisher
end
