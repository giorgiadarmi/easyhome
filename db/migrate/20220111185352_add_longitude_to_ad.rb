class AddLongitudeToAd < ActiveRecord::Migration[6.1]
  def change
    add_column :ads, :longitude, :float
  end
end
