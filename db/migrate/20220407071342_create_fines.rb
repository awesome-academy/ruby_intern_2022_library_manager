class CreateFines < ActiveRecord::Migration[7.0]
  def change
    create_table :fines do |t|
      t.decimal :amount, null: false

      t.belongs_to :book_return, foreign_key: {to_table: :book_returns},
                      null: false, index: {unique: true}

      t.timestamps
    end
  end
end
