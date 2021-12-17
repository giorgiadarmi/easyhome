class Article < ApplicationRecord
    belongs_to :mate
	has_many :comments

end
