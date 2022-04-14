class AddBelongsToPublishersAddresses < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :publishers, :address, index: {unique: true},
                    foreign_key: {to_table: :addresses}
    change_column_null :publishers, :address_id, true
  end
end
