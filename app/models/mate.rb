class Mate < ApplicationRecord
    has_many :ads, dependent: :destroy 
end
