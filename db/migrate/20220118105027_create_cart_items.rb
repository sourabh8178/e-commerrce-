class CreateCartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items do |t|
      t.shopping_cart_item_fields
      t.timestamps
    end
  end
end
