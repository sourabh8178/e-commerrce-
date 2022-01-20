class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :subcategory_id
      t.text :discription
      t.decimal :price
      t.string :image

      t.timestamps
    end
  end
end
