class AddColumnToOrderBooking < ActiveRecord::Migration[6.0]
  def change
    # remove_column :order_bookings, :product_id#, :string, default: [], array: true
    add_column :order_bookings, :product_id, :string, default: [], array: true
  end
end
