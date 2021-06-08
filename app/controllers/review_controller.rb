class ReviewController < ApplicationController

def new
     authorize @review
  end
  def create
    authorize @review
  end
end
