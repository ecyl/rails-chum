class ItinerariesController < ApplicationController
  before_action :set_itinerary, only: :show
  def index
    # @itineraries = Itinerary.all

    # this line points to scope within itinerary_policy & takes the scope given
    # e.g. if it says scope.where(user: current_user) -> i can only get itinerary created by user
    @itineraries = policy_scope(Itinerary).order(created_at: :desc)
  end

  def show
    @markers = @itinerary.events.geocoded.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude
      }
    end

    # to get users interested to join itinerary
    @organiser = @itinerary.user
    @pending_users = find_pending_users
    @accepted_users = find_accepted_users

    # Group events according to date
    @cost = 0
    @events = {}
    @itinerary.events.each do |event|
      @cost += event.cost
      start = event.date_start.to_date
      if @events.key?(start)
        @events[start] << event
      else
        @events[start] = [event]
      end
    end
    @events = @events.sort.to_h
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
    authorize @itinerary
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

  def find_pending_users
    @itinarary = set_itinerary
    @pending_users = @itinerary.itinerary_users.where(status: "pending")
  end

  def find_accepted_users
    @itinarary = set_itinerary
    @accepted_users = @itinerary.itinerary_users.where(status: "accepted")
  end
end
