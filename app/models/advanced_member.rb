class AdvancedMember < Member
  has_many :book_freezings, foreign_key: :advanced_member_id,
            dependent: :destroy
end
