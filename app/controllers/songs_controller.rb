class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  # GET /songs
  # GET /songs.json
  def index
    @songs = Song.all
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
  end

  # GET /songs/new
  def new
    @song = Song.new
    @album = Album.find(params[:album])
  end

  # GET /songs/1/edit
  def edit
    @album = Album.find(params[:album])
  end

  # POST /songs
  # POST /songs.json
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

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
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

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to user_songs_url(current_user), notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.fetch(:song, {})
    end
end
