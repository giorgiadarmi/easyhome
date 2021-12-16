class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
	  t.string 'title'
	  t.datetime 'release_date'
	  t.text 'text'
	  t.string 'author'
      t.timestamps
    end
  end
end
