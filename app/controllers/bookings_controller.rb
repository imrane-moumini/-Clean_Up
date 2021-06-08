class BookingsController < ApplicationController
  def new
    authorize @bookings
  end

  def create
    authorize @bookings
  end

  def show
    authorize @bookings
  end

  def edit
    authorize @bookings
  end

  def update
    authorize @bookings
  end

  def destroy
    authorize @bookings
  end
end
