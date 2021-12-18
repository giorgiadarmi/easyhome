class Mate < ApplicationRecord
    has_many :ads, dependent: :destroy 
    has_many :articles, dependent: :destroy 
    has_many :comments

end
