class CreateBusinesses < ActiveRecord::Migration[7.1]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :phone_number
      t.integer :registration_number
      t.integer :tax_rate
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
