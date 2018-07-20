class EventsController < ApplicationController

  before_filter :set_event, only: [:show, :update]
  before_filter :set_groups, only: [:show]

  def show
    @textbreaker = [ "option1.png", "option2.png", "option3.png", "option4.png" ]
    @group = Group.new
    @primary_venue_photo = VenuePhoto.find(@event.primary_venue_photo).file_url unless @event.primary_venue_photo.nil?
    @venue_photos = VenuePhoto.where.not(id: @event.primary_venue_photo) || []
    @parties = Party.order(:order)
    @songs = Song.new(song_params)
  end

  def update
    @event.update_attributes(event_params)
    redirect_to :back
  end

  def create
    @song = Song.new
    if @song.save
      redirect_to root_path, notice: 'Great pick! We added that to our list!'
    else
      redirect_to root_path, notice: "We couldn't add that one right now. Try again in a few minutes."
    end
  end

  private

  def set_event
    @event = Event.find params[:id] || default_event
  end

  def event_params
    params.require(:event).permit(:date, :location, :active, :title, :primary_venue_photo, :venue_body, :venue_directions)
  end

  def set_groups
    @groups = @event.groups
  end
  def song_params
    params.permit(:title, :artist)
  end
end
