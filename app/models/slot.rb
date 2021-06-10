class Slot < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :start_time, presence: true
  validates :end_time, presence: true

  def available?(start_time, end_time)
    asked_hours_free = self.bookings.all? do |booking|
      if start_time <= booking.start_time && end_time <= booking.start_time
      else
       start_time >= booking.end_time
      end
    end
  end
end
