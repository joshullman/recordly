class Favorite < ApplicationRecord
  belongs_to :favoriteable
  belongs_to :user
end
