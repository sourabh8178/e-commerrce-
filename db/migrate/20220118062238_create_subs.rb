class CreateSubs < ActiveRecord::Migration[6.0]
  def change
    create_table :subs do |t|
      t.string :category
      t.string :name
      t.integer :category_id

      t.timestamps
    end
  end
end
