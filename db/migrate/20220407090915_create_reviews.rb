class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :content, null: false
      t.integer :score, null: false

      t.belongs_to :member, null: false, foreign_key: {to_table: :accounts}
      t.belongs_to :book, null: false,
                      foreign_key: {to_table: :books}

      t.timestamps
    end
  end
end
