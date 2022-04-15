class Account < ApplicationRecord
  enum :status, normal: 0, banned: 1, bad: 2
end
