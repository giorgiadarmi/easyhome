class Article < ApplicationRecord
    belongs_to :mate
	has_many :comments, dependent: :destroy
	has_many :favorite_articles, dependent: :destroy
    has_many :favorited_by, through: :favorite_articles, source: :mate, dependent: :destroy
end
