class CreateAds < ActiveRecord::Migration[6.1]
  def change
    create_table :ads do |t|
      t.string 'owner'
      t.string 'adtype'
      t.string 'title'
      t.text 'notice' 
      t.string 'location' 
      t.timestamps
    end
  end
end
