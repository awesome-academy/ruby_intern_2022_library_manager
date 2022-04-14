class CreateCheckTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :fine_transactions, :bank_name, :string
    add_column :fine_transactions, :check_number, :string
  end
end
