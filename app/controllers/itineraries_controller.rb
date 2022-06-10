class ItinerariesController < ApplicationController
  before_action :set_itinerary, only: :show
  def index
    # @itineraries = Itinerary.all

    # this line points to scope within itinerary_policy & takes the scope given
    # e.g. if it says scope.where(user: current_user) -> i can only get itinerary created by user
    @itineraries = policy_scope(Itinerary).order(created_at: :desc)
  end


  def show
    @itinerary
  end

  def new
    @itinerary = Itinerary.new
    authorize @itinerary
  end


  def create
    Itinerary.transaction do
      @itinerary = Itinerary.new(itinerary_params)
      @itinerary.user = current_user

      @chatroom ||= Chatroom.new
      @itinerary.chatroom = @chatroom

      @chatroom.users << current_user
      # @chatroom_user = @chatroom.user_chatrooms.build(user: @itinerary.user)
      @chatroom.save!

      @itinerary.save!
      redirect_to itinerary_path(@itinerary)
    end
  rescue ActiveRecord::RecordInvalid
    render :new
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:title, :participant_limit, :description,
                                      :deadline, :finalised, :photo)
  end


  def set_itinerary
    @itinerary = Itinerary.find(params[:id])
    authorize @itinerary
  end
end
