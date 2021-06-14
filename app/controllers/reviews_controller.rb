class ReviewsController < ApplicationController

  def create

    @review = Review.new(review_params)
    @booking = Booking.find([params:booking_id])
    authorize @review
    @review.booking = @booking

      if @review.save
        redirect_to dashboard_path
      else
        render :new
      end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
