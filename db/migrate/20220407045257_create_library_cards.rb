class CreateLibraryCards < ActiveRecord::Migration[7.0]
  def change
    create_table :library_cards do |t|
      t.string :car_code, null: false
      t.string :bar_code, null: false
      t.date :issued_at, null: false

      t.belongs_to :member, foreign_key: {to_table: :accounts},
                    index: {unique: true}

      t.timestamps
    end
  end
end
