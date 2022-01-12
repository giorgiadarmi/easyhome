class Ad < ApplicationRecord
    belongs_to :user

   
    def google_map(center)
        "https://maps.googleapis.com/maps/api/staticmap?center=#{center}&size=500x500&zoom=17&key=[YOUR_API_KEY]"
    end
    def address
        [street, city, state, country].compact.join(', ')
    end
end
