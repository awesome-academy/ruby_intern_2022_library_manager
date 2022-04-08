class BookReservation < ApplicationRecord
  enum :status, waiting: 0, hold: 1

  belongs_to :member
  belongs_to :book
end
