class UsersController < ApplicationController

  def show
    if !params[:id]
      @user = current_user
    else
      @user = User.find(params[:id])
    end
    @favorite_songs = find_song_favorites
    @favorite_albums = find_album_favorites
    @favorite_artists = find_artist_favorites
  end

  private
    def find_song_favorites
      Favorite.where(user_id: current_user.id, favoriteable_type: "Song")
    end

    def find_album_favorites
      Favorite.where(user_id: current_user.id, favoriteable_type: "Album")
    end

    def find_artist_favorites
      Favorite.where(user_id: current_user.id, favoriteable_type: "Artist")
    end

    def user_params
      params.fetch(:user, {})
    end
end
