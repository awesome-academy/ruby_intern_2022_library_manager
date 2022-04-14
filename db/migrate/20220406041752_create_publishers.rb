class CreatePublishers < ActiveRecord::Migration[7.0]
  def change
    create_table :publishers do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :contact, null: false

      t.timestamps
    end
  end
end
