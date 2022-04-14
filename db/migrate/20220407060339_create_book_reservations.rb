class CreateBookReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :book_reservations do |t|
      t.integer :status, null: false, default: 0
      t.string :note
      t.datetime :reserve_date

      t.belongs_to :book, foreign_key: {to_table: :books}, null: false
      t.belongs_to :member, foreign_key: {to_table: :accounts}, null: false

      t.timestamps
    end
  end
end
