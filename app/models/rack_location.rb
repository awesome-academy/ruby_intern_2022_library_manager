class RackLocation < ApplicationRecord
  belongs_to :book_item, optional: true

  scope :suitable_for,
        ->(book_item){where(book_item: [nil, book_item])}
  scope :un_used, ->{where(book_item: nil)}
end
