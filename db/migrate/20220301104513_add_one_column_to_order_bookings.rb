class AddOneColumnToOrderBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :order_bookings, :cash_on_delivery, :boolean
  end
end
