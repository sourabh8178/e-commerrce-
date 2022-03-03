class RemoveCancelOrderFromOrderStatuses < ActiveRecord::Migration[6.0]
  def change
    remove_column :order_statuses, :cancel_order, :boolean
  end
end
