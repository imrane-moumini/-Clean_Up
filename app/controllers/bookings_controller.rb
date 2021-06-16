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
    @reviews = []
    Review.all.map { |review| @reviews << review if review.booking.slot.user_id == @available_slot_one.user.id }
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
    @reviews = Review.all
    #@dashboard = dashboard.new
    session = Stripe::Checkout::Session.create({
        payment_method_types: ['card'],
        line_items: [{
          name: @booking.slot.user.first_name,
          amount: @booking.computed_price,
          currency: 'eur',
          quantity: 1
        }],
        success_url: dashboard_url,
        cancel_url: dashboard_url
      })
      @booking.update(checkout_session_id: session.id)
      redirect_to dashboard_path
  end

  def create


    @booking = Booking.new(booking_params)
    authorize @booking

    @booking.user = current_user
    @booking.task_accomplished = false
    @booking.booking_price_cents = @booking.computed_price
    if @booking.save
      redirect_to booking_path(@booking)

    else
      render :new
    end

  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path, notice: 'Votre réservation a bien été annulée.'
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
