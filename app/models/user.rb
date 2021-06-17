class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  monetize :user_price_cents
  has_one_attached :photo
  has_one_attached :degree_file
  has_many :slots
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many :messages

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def average_rating
    reviews = slots
    .map { |slot| slot.bookings }.flatten
    .map { |booking| booking.review }.compact

    ratings = reviews.map { |review| review.rating }

    avg = ratings.sum / ratings.length
    avg.round(half: :up)
  end

end
