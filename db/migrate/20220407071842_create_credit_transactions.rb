class CreateCreditTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :fine_transactions, :card_number, :string
    add_column :fine_transactions, :card_holder, :string
    add_column :fine_transactions, :expiration_date, :datetime
  end
end
