class RemoveCustomerPhoneFromOrderBooking < ActiveRecord::Migration[6.0]
  def change
    remove_column :order_bookings, :customer_phone, :integer
  end
end
