class CreateRackLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :rack_locations do |t|
      t.integer :number, null: false
      t.string :location_identifier, null: false

      t.references :book_item_id, foreign_key: {to_table: :book_items},
                    index: true

      t.timestamps
    end
  end
end
