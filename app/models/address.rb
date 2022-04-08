class Address < ApplicationRecord
  has_one :publisher, dependent: :nullify
  has_one :account, dependent: :nullify
end
