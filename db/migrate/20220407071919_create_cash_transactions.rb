class CreateCashTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :fine_transactions, :cash_tendered, :decimal
  end
end
