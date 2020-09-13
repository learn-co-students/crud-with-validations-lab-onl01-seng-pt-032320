class SongsController < ApplicationController
  before_action :set_song!, only: %i[show edit update destroy]

  def index
    @songs = Song.all
  end

  def show; end

  def new
    @song = Song.new
  end

  def create
    print params
    @song = Song.new(song_params)

    if @song.save
      redirect_to song_path(@song)
    else
      print(@song.errors.full_messages)
      render :new
    end
  end

  def edit; end

  def update
    print params
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      print(@song.errors.full_messages)
      render :edit
    end
  end

  def destroy
    @song.destroy

    redirect_to songs_path
  end

  private

  def set_song!
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end
end
