class AddLibrarianAttributesToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :start_date, :date
    add_column :accounts, :end_date, :date
    add_column :accounts, :super_admin, :boolean
  end
end
