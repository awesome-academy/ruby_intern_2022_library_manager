class CreateBookLendings < ActiveRecord::Migration[7.0]
  def change
    create_table :book_lendings do |t|
      t.datetime :due_date, null: false
      t.integer :book_status, null: false

      t.belongs_to :member, null: false, foreign_key: {to_table: :accounts}
      t.belongs_to :lender, null: false, foreign_key: {to_table: :accounts}
      t.belongs_to :reservation, foreign_key: {to_table: :book_reservations},
                      unique: true
      t.belongs_to :book_item, null: false,
                    foreign_key: {to_table: :book_items}

    end
  end
end
