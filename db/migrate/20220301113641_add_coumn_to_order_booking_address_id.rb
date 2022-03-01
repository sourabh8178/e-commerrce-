class AddCoumnToOrderBookingAddressId < ActiveRecord::Migration[6.0]
  def change
    add_column :order_bookings, :address_id, :integer
  end
end
