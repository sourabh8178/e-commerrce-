class AddColumnToOrderStatus < ActiveRecord::Migration[6.0]
  def change
    add_column :order_statuses, :refund, :integer
  end
end
