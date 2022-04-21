class Publisher < ApplicationRecord
  CREATABLE_ATTRS = [:name, :description, :contact,
                      address_attributes:
                      [:id, :street, :sub_district, :district, :city]].freeze

  has_one :address, as: :locatable, dependent: :destroy

  has_many :books_publishers, dependent: :restrict_with_exception
  has_many :books, through: :books_publishers

  accepts_nested_attributes_for :address

  validates :name, presence: true,
              length: {maximum: Settings.validation.name.length.max}
  validates :description, :contact, presence: true

  scope :ordered_by_name, ->{order(name: :asc)}

  delegate :street, :sub_district, :district, :city, to: :address
end
