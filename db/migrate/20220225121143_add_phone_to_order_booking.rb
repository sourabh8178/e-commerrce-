class AddPhoneToOrderBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :order_bookings, :phone, :string
  end
end
