class ReviewsController < ApplicationController
  before_action :find_organiser

  def new
    @review = authorize Review.new

    @static_navbar = true
  end

  def create
    @review = authorize Review.new(review_params)
    @sender = current_user
    @review.user = @sender
    @review.organiser_id = @organiser.id

    if @review.save
      redirect_to user_path(@organiser)
    else
      render :new
    end
  end

  private

  def find_organiser
    @organiser = User.find(params[:user_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
