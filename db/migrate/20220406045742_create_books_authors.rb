class CreateBooksAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :books_authors, id: false do |t|
      t.belongs_to :book, null: false, foreign_key: {to_table: :books}
      t.belongs_to :author, null: false, foreign_key: {to_table: :authors}

      t.timestamps
    end
  end
end
