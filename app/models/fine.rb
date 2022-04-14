class Fine < ApplicationRecord
  belongs_to :book_return

  has_many :fine_transactions, dependent: :destroy
end
