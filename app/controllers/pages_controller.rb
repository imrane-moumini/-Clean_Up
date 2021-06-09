class PagesController < ApplicationController
  #skip_before_action :authenticate_user! #, only: [ :home ]

  def home
  end

  def dashboard
    ville = params[:ville]
    start_query = params[:start_time]
    end_query = params[:end_time]
    if ville.present? && start_query.present? && end_query.present?
      @slots = Slot.joins(:user).where("address ILIKE ?", "%#{params[:ville]}%")
      @slots.select do |slot|
        slot.start_time <= start_query && slot.end_time >= end_query
      end
      @available_slots = @slots.select do |slot|
        slot.available?(start_query, end_query)
        end
        @available_slot_one = @available_slots.sample

    else
      @bookings = Booking.all
    end
  end
end
