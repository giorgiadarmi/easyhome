class FavoriteAd < ApplicationRecord
  belongs_to :user
  belongs_to :ad
end
