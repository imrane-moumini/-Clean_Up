class Booking < ApplicationRecord
  has_one :review, dependent: :destroy
  after_create :create_chatroom
  belongs_to :user
  belongs_to :slot
  has_one :chatroom, dependent: :destroy


  validates :start_time, presence: true
  validates :end_time, presence: true

  def computed_price
    (((self.end_time - self.start_time)/3600) * self.user.user_price).fractional
  end


  def display_price
    (computed_price / 100.00).to_s + ' €'
  end

  private
  def create_chatroom
    Chatroom.create(booking: self)
  end

end
