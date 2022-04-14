class BookFreezing < ApplicationRecord
  belongs_to :advanced_member
  belongs_to :book
end
