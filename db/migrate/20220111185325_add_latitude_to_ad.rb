class AddLatitudeToAd < ActiveRecord::Migration[6.1]
  def change
    add_column :ads, :latitude, :float
  end
end
