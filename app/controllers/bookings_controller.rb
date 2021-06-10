class BookingsController < ApplicationController
  def new

    #@dashboard = Dashboard.find(params[:dashboard_id])
    @booking = Booking.new
    authorize @booking
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
    #@dashboard = dashboard.new
  end

  def create
    authorize @bookings

    @booking = Booking.new(booking_params)
    #@dashboard = Dashboard.find(params[:dashboard_id])
    @booking.user = current_user
    #@booking.dashboard = @dashboard
      if @booking.save
        redirect_to dashboard_path(@dashboard)
      else
        render :new
      end
  end

  def destroy
    authorize @bookings

    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to home_path(@home), notice: 'This booking was successfully destroyed.'
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :status, :end_time)
  end
end
