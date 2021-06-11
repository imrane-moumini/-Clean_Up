class ReviewsController < ApplicationController

  def create

    @review = Review.new(review_params)
    authorize @review
    @review.booking = booking_id

      if @review.save
        redirect_to user_path(@user)
      else
        render :new
      end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :user_id)
  end
end
