class FavoriteArticle < ApplicationRecord
    belongs_to :mate
    belongs_to :article
end
