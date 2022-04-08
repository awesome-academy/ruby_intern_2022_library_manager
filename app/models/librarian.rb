class Librarian < Account
  has_many :book_lendings, foreign_key: :lender_id,
                    dependent: :restrict_with_exception
  has_many :borrowers, through: :book_lendings, foreign_key: :member_id,
            class_name: Member.name
  has_many :book_returns, foreign_key: :recipient_id,
              dependent: :restrict_with_exception
end
