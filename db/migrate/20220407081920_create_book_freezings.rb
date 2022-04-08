class CreateBookFreezings < ActiveRecord::Migration[7.0]
  def change
    create_table :book_freezings do |t|
      t.integer :status, null: false
      t.string :note, null: false
      t.integer :number_to_free, null: false

      t.references :book, foreign_key: {to_table: :books}, null: false
      t.references :advanced_member, foreign_key: {to_table: :accounts},
                      null: false

      t.timestamps
    end

    add_index :book_freezings, [:book_id, :advanced_member_id], unique: true
  end
end
