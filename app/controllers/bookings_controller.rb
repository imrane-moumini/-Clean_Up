class BookingsController < ApplicationController
  def new

    #@dashboard = Dashboard.find(params[:dashboard_id])
    @booking = Booking.new
    authorize @booking


    @ville = params[:ville]
    @start_query = params[:start_time]
    @end_query = params[:end_time]

    if @ville.present? && @start_query.present? && @end_query.present?
      @slots = Slot.joins(:user).where("address ILIKE ?", "%#{params[:ville]}%")
      @slots.select do |slot|
        slot.start_time <= @start_query && slot.end_time >= @end_query
      end
      @available_slots = @slots.select do |slot|
        slot.available?(@start_query, @end_query)
      end
    end

    @available_slot_one = @available_slots.sample

  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
    #@dashboard = dashboard.new
  end

  def create


    @booking = Booking.create!(booking_params)
    authorize @booking

    @booking.user = current_user
    @booking.task_accomplished = false
    #@booking.dashboard = @dashboard
    @booking.booking_price_cents = ( ((@booking.end_time - @booking.start_time)/3600) * @booking.user.user_price_cents )


        session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: @booking.slot.user.first_name,
      images: @booking.slot.user.photo,
      amount: @booking.booking_price_cents,
      currency: 'eur',
      quantity: 1
    }],
    success_url: booking_url(@booking),
    cancel_url: booking_url(@booking)
  )




  @booking.update(checkout_session_id: session.id)
  redirect_to new_booking_payment_path(@booking)

  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path, notice: 'This booking was successfully destroyed.'
    authorize @booking

  end

  def recap
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  private

  def booking_params

    params.require(:booking).permit(:start_time, :status, :end_time, :slot_id, :task_accomplished)

  end
end
