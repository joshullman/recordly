class Album < ApplicationRecord
	belongs_to :user
	belongs_to :artist
	has_many   :songs
	has_many   :favorites, as: :favoriteable

	def self.search(search)
		if search
			self.where('title LIKE ?', "%#{search}%")
		else
			self.all
		end
	end
end
