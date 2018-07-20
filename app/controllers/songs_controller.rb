class SongsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to root_path, notice: 'Great pick! We added that to our list!'
    else
      redirect_to root_path, notice: "We couldn't add that one right now. Try again in a few minutes."
    end
  end

  def edit
  end

  def update
    @song.update_attributes(song_params)
    redirect_to :back
  end

  def destroy
    @song.destroy
    redirect_to :back
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist)
  end

  def set_event
    @event = Event.find params[:event_id] || default_event
  end

  def set_song
    song_id = params[:song_id] || params[:id]
    @song = @event.stores.find song_id
  end

  def set_song
    @songs = @event.songs.all
  end
end
