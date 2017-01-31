class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  def index
    find_album_favorites
    @albums = Album.all
  end

  def show
    @songs = @album.songs
  end

  def new
    @album = Album.new
    @artist = Artist.find(params[:artist])
  end

  def edit
    @artist = Artist.find(params[:artist])
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @album = Album.new(user_id: params[:user_id], artist_id: params[:artist_id], title: params[:album][:title])

    respond_to do |format|
      if @album.save
        format.html { redirect_to user_album_path(current_user, @album), notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @album.update(user_id: params[:user_id], artist_id: params[:artist_id], title: params[:album][:title])
        format.html { redirect_to user_album_path(current_user, @album), notice: 'Album was successfully updated.' }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to user_albums_url(current_user), notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def find_album_favorites
      @favorites = Favorites.where(user_id: current_user.id, favoriteable_type: "Album")
    end

    def find_song_favorites
      @favorites = Favorites.where(user_id: current_user.id, favoriteable_type: "Song")
    end

    def set_album
      @album = Album.find(params[:id])
    end

    def album_params
      params.fetch(:album, {})
    end
end
