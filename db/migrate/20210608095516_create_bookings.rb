class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :slot, null: false, foreign_key: true
      t.time :start_time
      t.time :end_time
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
