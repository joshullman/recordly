class Artist < ApplicationRecord
	belongs_to :user
	has_many   :albums
	has_many   :songs, through: :albums
	has_many   :favorites, as: :favoriteable
end
