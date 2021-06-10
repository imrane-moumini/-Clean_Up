class AddTaskToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :task_accomplished, :boolean
    add_column :bookings, :booking_price, :integer
  end
end
