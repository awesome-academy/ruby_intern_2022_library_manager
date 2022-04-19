class Account < ApplicationRecord
  VALID_EMAIL_REGEX = Settings.validation.mail.regex.freeze

  enum :status, normal: 0, banned: 1, bad: 2

  validates :username, presence: true,
                      length: {maximum: Settings.validation.name.length.max},
                      uniqueness: true
  validates :email, presence: true,
                    length: {maximum: Settings.validation.mail.length.max},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: true
  validates :password, presence: true,
                  length: {minimum: Settings.validation.password.length.min},
                  allow_nil: true
  validates :phone_number, presence: true
  validates :first_name, :last_name, presence: true,
                  length: {maximum: Settings.validation.name.length.max}

  has_secure_password

  def is_librarian?
    self.class == Librarian
  end

  def is_member?
    self.class == Member
  end
end
