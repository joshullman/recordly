class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  # GET /albums
  # GET /albums.json
  def index
    @albums = Album.all
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
    @songs = @album.songs
  end

  # GET /albums/new
  def new
    @album = Album.new
    @artist = Artist.find(params[:artist])
  end

  # GET /albums/1/edit
  def edit
    @artist = Artist.find(params[:artist])
  end

  # POST /albums
  # POST /albums.json
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

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
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

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to user_albums_url(current_user), notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.fetch(:album, {})
    end
end
