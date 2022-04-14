class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :isbn, null: false
      t.string :title, null: false
      t.integer :subject, null: false
      t.string :language, null: false
      t.integer :number_of_pages, null: false
      t.date :publication_date, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
