class AddAdvancedMemberAttributesToAccount < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :academic_rank, :int
    add_column :accounts, :academic_degree, :int
    add_column :accounts, :unit, :string
    add_column :accounts, :role, :string
  end
end
