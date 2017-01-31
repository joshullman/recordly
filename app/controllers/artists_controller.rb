class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  def index
    find_artist_favorites
    @artists = Artist.all
  end

  def show
    find_album_favorites
    @albums = @artist.albums
    @album = Album.new
  end

  def new
    @artist = Artist.new
  end

  def edit
  end

  def create
    @artist = Artist.new(user_id: params[:user_id], name: params[:artist][:name] )

    respond_to do |format|
      if @artist.save
        format.html { redirect_to user_artist_path(current_user, @artist), notice: 'Artist was successfully created.' }
        format.json { render :show, status: :created, location: @artist }
      else
        format.html { render :new }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @artist.update(user_id: params[:user_id], name: params[:artist][:name] )
        format.html { redirect_to user_artist_path(current_user, @artist), notice: 'Artist was successfully updated.' }
        format.json { render :show, status: :ok, location: @artist }
      else
        format.html { render :edit }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @artist.destroy
    respond_to do |format|
      format.html { redirect_to user_artists_url(current_user), notice: 'Artist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def find_artist_favorites
      @favorites = Favorites.where(user_id: current_user.id, favoriteable_type: "Artist")
    end

    def find_album_favorites
      @favorites = Favorites.where(user_id: current_user.id, favoriteable_type: "Album")
    end

    def set_artist
      @artist = Artist.find(params[:id])
    end

    def artist_params
      params.fetch(:artist, {})
    end
end
