class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    find_song_favorites
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
    @album = Album.find(params[:album])
  end

  def edit
    @album = Album.find(params[:album])
  end

  def create
    @album = Album.find(params[:album_id])
    @song = Song.new(user_id: params[:user_id], album_id: params[:album_id], title: params[:song][:title])

    respond_to do |format|
      if @song.save
        format.html { redirect_to user_song_path(current_user, @song), notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @song.update(user_id: params[:user_id], album_id: params[:album_id], title: params[:song][:title])
        format.html { redirect_to user_song_path(current_user, @song), notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to user_songs_url(current_user), notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def find_song_favorites
      @favorites = Favorite.where(user_id: current_user.id, favoriteable_type: "Song")
    end

    def set_song
      @song = Song.find(params[:id])
    end

    def song_params
      params.fetch(:song, {})
    end
end
