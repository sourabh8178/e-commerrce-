class AddColumnToOrderBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :order_bookings, :user_id, :integer
  end
end
