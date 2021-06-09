class PagesController < ApplicationController
  #skip_before_action :authenticate_user! #, only: [ :home ]

  def home
  end

  def dashboard
    day = params[:day]
    start_query = params[:start_time]
    end_query = params[:end_time]
    if day.present? && start_query.present? && end_query.present?
      @slots = Slot.where(day: day)
      @slots.select do |slot|
        slot.start_time <= start_query && slot.end_time >= end_query
      end
      raise
      @available_slots = @slots.select do |slot|
        slot.available?(start_query, end_query)
        @available_slot_one = @available_slot.sample
      end
    else
      @bookings = Booking.all
    end
  end
end
