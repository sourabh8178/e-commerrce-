class AddColumnToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :discount, :decimal
  end
end
