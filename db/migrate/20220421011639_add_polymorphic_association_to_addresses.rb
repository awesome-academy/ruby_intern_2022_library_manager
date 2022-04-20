class AddPolymorphicAssociationToAddresses < ActiveRecord::Migration[7.0]
  def change
    rename_column :rack_locations, :book_item_id_id, :book_item_id
    remove_column :publishers, :address_id
    remove_column :accounts, :address_id
    add_column :addresses, :locatable_id, :bigint
    add_column :addresses, :locatable_type, :string
  end
end
