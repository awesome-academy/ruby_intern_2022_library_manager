class Address < ApplicationRecord
  belongs_to :locatable, polymorphic: true

  validates :street, :sub_district, :district, :city, presence: true
end
