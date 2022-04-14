class CreateFineTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :fine_transactions do |t|
      t.decimal :amount, null: false
      t.string :type, null: false

      t.belongs_to :fine, foreign_key: {to_table: :fines}

      t.timestamps
    end
  end
end
