class Artist < ApplicationRecord
	belongs_to :user
	has_many   :albums
	has_many   :songs, through: :albums
	has_many   :favorites, as: :favoriteable

	def self.search(search)
		if search
			self.where('name LIKE ?', "%#{search}%")
		else
			self.all
		end
	end
end
