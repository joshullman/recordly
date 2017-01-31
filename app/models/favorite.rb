class Favorite < ApplicationRecord
  belongs_to :favoriteable
  belongs_to :user

  def find_associated_media
  	id = self.favoriteable_id
  	case self.favoriteable_type
  	when "Artist"
  		Artist.find(id)
  	when "Album"
  		Album.find(id)
  	when "Song"
  		Song.find(id)
  	end
  end
end
