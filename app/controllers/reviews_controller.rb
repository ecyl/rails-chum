class ReviewsController < ApplicationController
  before_action :find_itinerary

  def new
    @review = authorize Review.new

    @static_navbar = true
  end

  def create
    @review = authorize Review.new(review_params)

    # author of the review
    @review.user = current_user

    # review for the itinerary
    @review.itinerary = @itinerary
    # @organiser = @itinerary.itinerary_users.where(status: "organiser")
    @organiser = User.find(@itinerary.user_id)

    if @review.save
      redirect_to user_path(@organiser)
    else
      render :new
    end
  end

  private

  def find_itinerary
    @itinerary = Itinerary.find(params[:itinerary_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
