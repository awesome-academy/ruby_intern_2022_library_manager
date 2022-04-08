class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :street, null: false
      t.string :sub_district, null: false
      t.string :district, null: false
      t.string :city, null: false
      t.bigint :locatable_id
      t.string :locatable_type

      t.timestamps
    end
  end
end
