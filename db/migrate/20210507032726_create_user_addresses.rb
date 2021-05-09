class CreateUserAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :user_addresses do |t|
      t.integer :postal_code
      t.text :address
      t.references :user
      t.timestamps
    end
  end
end
