class AddMemberAttributesToAccount < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :membership_status, :integer
    add_column :accounts, :card_code, :string
    add_column :accounts, :expiration_date, :date
  end
end
