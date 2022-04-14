class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
      t.integer :status, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.date :date_of_birth, null: false
      t.string :email, null: false
      t.string :remember_digest
      t.boolean :activated, null: false
      t.datetime :activated_at
      t.string :activation_digest
      t.string :reset_digest
      t.datetime :reset_sent_at
      t.string :phone_number, null: false
      t.string :type

      t.references :address, foreign_key: {to_table: :addresses},
                    index: {unique: true}

      t.timestamps
    end
  end
end
