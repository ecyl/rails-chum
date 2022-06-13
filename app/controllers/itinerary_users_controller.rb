class ItineraryUsersController < ApplicationController
  before_action :find_itinerary_users, only: [:accept, :reject]
  before_action :find_itinerary, only: [:new, :create]

  def accept
    @itinerary_user.status = "accepted"
    @itinerary = find_itinerary_by_assocation

    if @itinerary_user.save
      redirect_to itinerary_path(@itinerary), notice: "The user is accepted."
    else
      redirect_to itinerary_path(@itinerary), notice: "Failed to accept user"
    end
    authorize @itinerary_user  # look for ItineraryUserPolicy class
  end

  def reject
    @itinerary_user.status = "rejected"
    @itinerary = find_itinerary_by_assocation

    if @itinerary_user.save
      redirect_to itinerary_path(@itinerary), notice: "The user is rejected."
    else
      redirect_to itinerary_path(@itinerary), notice: "Failed to reject user"
    end

    authorize @itinerary_user  # look for ItineraryUserPolicy class
  end

  def new
    @itinerary_user = ItineraryUser.new
    authorize @itinerary_user
  end

  def create
    @itinerary_user = ItineraryUser.new(itinerary_user_params)
    @itinerary_user.itinerary = @itinerary
    @itinerary_user.user = current_user

    if @itinerary_user.save!
      redirect_to itinerary_path(@itinerary)
    else
      render :new
    end
    authorize @itinerary_user
  end

  private

  def find_itinerary_users
    @itinerary_user = ItineraryUser.find(params[:id])
  end

  def find_itinerary
    @itinerary = Itinerary.find(params[:itinerary_id])
  end

  def find_itinerary_by_assocation
    @itinerary = @itinerary_user.itinerary
  end

  def itinerary_user_params
    params.require(:itinerary_user).permit(:message)
  end
end
