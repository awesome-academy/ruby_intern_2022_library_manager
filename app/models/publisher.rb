class Publisher < ApplicationRecord
  belongs_to :address, optional: true

  has_many :books, through: :books_publishers
end
