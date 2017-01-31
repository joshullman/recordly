class Album < ApplicationRecord
	belongs_to :user
	belongs_to :artist
	has_many   :songs
	has_many   :favorites, as: :favoriteable
end
