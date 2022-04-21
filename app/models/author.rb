class Author < ApplicationRecord
  has_many :books_authors, dependent: :restrict_with_exception
  has_many :books, through: :books_authors

  validates :name, presence: true,
           length: {maximum: Settings.validation.name.length.max}
  validates :bio, presence: true,
           length: {maximum: Settings.validation.paragraph.length.max}

  scope :ordered_by_name, ->{order(name: :asc)}
end
