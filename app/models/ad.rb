class Ad < ApplicationRecord
    belongs_to :user

    def address
        [street, city, state, country].compact.join(', ')
    end
end
