class RemoveBookingPriceFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :booking_price
  end
end
