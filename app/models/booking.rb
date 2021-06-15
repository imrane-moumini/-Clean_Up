class Booking < ApplicationRecord
  has_one :review, dependent: :destroy
  after_create :create_chatroom
  belongs_to :user
  belongs_to :slot
  has_one :chatroom, dependent: :destroy


  validates :start_time, presence: true
  validates :end_time, presence: true

  private
  def create_chatroom
    Chatroom.create(booking: self)
  end

end
