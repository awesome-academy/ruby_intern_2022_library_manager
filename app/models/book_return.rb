class BookReturn < ApplicationRecord
  enum :book_status, normal: 0, nice: 1, old: 2, damaged: 3

  belongs_to :book_lending
  belongs_to :recipient, class_name: Librarian.name

  has_one :fine, dependent: :restrict_with_exception
end
