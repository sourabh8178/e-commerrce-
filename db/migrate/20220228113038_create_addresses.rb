class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :email
      t.integer :phone
      t.string :line1
      t.string :line2
      t.string :landmark
      t.string :state
      t.integer :pincode
      t.string :country

      t.timestamps
    end
  end
end
