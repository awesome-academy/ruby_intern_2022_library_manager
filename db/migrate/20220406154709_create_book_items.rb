class CreateBookItems < ActiveRecord::Migration[7.0]
  def change
    create_table :book_items do |t|
      t.string :bar_code, null: false
      t.boolean :is_reference_only, null: false
      t.decimal :price, null: false
      t.integer :format, null: false
      t.integer :status, null: false
      t.date :date_of_purchase, null: false

      t.belongs_to :book, index: true, foreign_key: {to_table: :books},
                    null: false

      t.timestamps
    end
  end
end
