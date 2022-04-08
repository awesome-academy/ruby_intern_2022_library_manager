class Member < Account
  enum :membership_status, off: 0, on: 1

  has_one :library_card, dependent: :destroy

  has_many :book_reservations, dependent: :restrict_with_exception
  has_many :books, through: :book_reservations
  has_many :book_lendings, dependent: :restrict_with_exception
  has_many :lenders, class_name: Librarian.name, through: :book_lendings
  has_many :reviews, dependent: :restrict_with_exception

  validates :card_code, :expiration_date,
            presence: true
end
