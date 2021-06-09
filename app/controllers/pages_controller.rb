class PagesController < ApplicationController
  #skip_before_action :authenticate_user! #, only: [ :home ]

  def home
  end

  def dashboard
    day = params[:day]
    start_time = params[:start_time]
    end_time = params[:end_time]
    if day.present? && start_time.present? && end_time.present?
      @slots = Slot.where(day: day)
      @slots.select do |slot|
        slot.start_time <= start_time && slot.end_time >= end_time
      end

      @available_slots = @slots.select do |slot|
        raise
        slot.available?(start_time, end_time)
        @available_slot_one = @available_slot.sample
      end
    else
      @bookings = Booking.all
    end
  end
end
