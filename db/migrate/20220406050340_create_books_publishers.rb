class CreateBooksPublishers < ActiveRecord::Migration[7.0]
  def change
    create_table :books_publishers, id: false do |t|
      t.belongs_to :book, null: false, foreign_key: {to_table: :books}
      t.belongs_to :publisher, null: false,
                    foreign_key: {to_table: :publishers}

      t.timestamps
    end
  end
end
