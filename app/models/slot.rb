class Slot < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :day, presence: true
end
