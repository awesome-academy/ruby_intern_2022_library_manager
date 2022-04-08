class CreateBookReturns < ActiveRecord::Migration[7.0]
  def change
    create_table :book_returns do |t|
      t.integer :book_status, null: false

      t.belongs_to :recipient, foreign_key: {to_table: :accounts}, null: false
      t.belongs_to :book_lending, foreign_key: {to_table: :book_lendings},
                      null: false, unique: true

      t.timestamps
    end
  end
end
