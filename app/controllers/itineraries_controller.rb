class ItinerariesController < ApplicationController
  before_action :set_itinerary, only: [:show, :confirm, :finalise]

  def index
    # @itineraries = Itinerary.all

    # this line points to scope within itinerary_policy & takes the scope given
    # e.g. if it says scope.where(user: current_user) -> i can only get itinerary created by user
    @itineraries = policy_scope(Itinerary).order(created_at: :desc)
    # @itineraries = Itinerary.where(user: @user).order(created_at: :desc)

    # navbar style
    @banner_navbar = true

    if params[:query].present?
      @itineraries = @itineraries.where('destination ILIKE ?', "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html
      format.text { render partial: 'itineraries/list', locals: { itineraries: @itineraries }, formats: [:html] }
    end
  end

  def show
    @banner_navbar = true
    @markers = @itinerary.events.geocoded.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude
      }
    end

    # to send request for itinerary_user
    @itinerary_user = ItineraryUser.new

    # to get users interested to join itinerary
    @organiser = @itinerary.user
    @pending_users = find_pending_users
    @accepted_users = find_accepted_users

    # for announcements
    @announcement = Announcement.new

    # Group events according to date
    @events = {}
    @itinerary.events.each do |event|
      start = event.date_start.to_date
      if @events.key?(start)
        @events[start] << event
      else
        @events[start] = [event]
      end
    end
    @events = @events.sort.to_h
    authorize @itinerary
  end

  def new
    @itinerary = Itinerary.new
    authorize @itinerary

    # navbar style
    @banner_navbar = false
    @static_navbar = true
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

  def finalise
    # PATCH action to update finalised => true
    @itinerary.finalised = true

    if @itinerary.save
      # insert flash confirmation
      redirect_to itinerary_path(@itinerary), notice: "The itinerary is finalised"
    else
      # insert flash confirmation
      redirect_to itinerary_path(@itinerary), notice: "The itinerary failed to finalise"
    end
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:title, :participant_limit, :description,
                                      :deadline, :finalised, :photo, :destination)
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

  def accepted
    false
    # authorize @itinerary
  end

end
