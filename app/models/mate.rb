class Mate < ApplicationRecord
    has_many :ads, dependent: :destroy 
    has_many :articles, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :favorite_articles, dependent: :destroy
    has_many :favorites, through: :favorite_articles, source: :article, dependent: :destroy
end
