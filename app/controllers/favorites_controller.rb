class FavoritesController < ApplicationController

	def create
		case params[:media_type]
			when "Artist"
				media = Artist.find(params[:media_id])
			when "Album"
				media = Album.find(params[:media_id])
			when "Song"
				media = Song.find(params[:media_id])
		end
		media.favorites.create!(user_id: current_user.id)
		p media
		p media.favorites
		redirect_to user_path(current_user)
	end

	def destroy
		Favorite.find(params[:id]).destroy
		redirect_to user_path(current_user)
	end

end