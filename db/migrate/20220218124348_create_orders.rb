class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :cart_id
      t.integer :product_id
      t.decimal :price
      t.integer :status, default: "0"
      t.integer :quantity
      t.string :first_name
      t.string :last_name
      t.string :email
      t.numeric :phone
      t.string :country
      t.string :address
      t.string :town
      t.string :district
      t.integer :postal_code

      t.timestamps
    end
  end
end
