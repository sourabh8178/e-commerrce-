class AddColumnToOrderStatuses < ActiveRecord::Migration[6.0]
  def change
    add_column :order_statuses, :cancel_order, :boolean
  end
end
