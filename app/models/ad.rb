class Ad < ApplicationRecord
	has_many :favorite_ads, dependent: :destroy
    has_many :favorited_by, through: :favorite_ads, source: :user, dependent: :destroy
end
