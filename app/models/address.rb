class Address < ApplicationRecord
  belongs_to :locatable, polymorphic: true
end
