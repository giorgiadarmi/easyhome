class CreateFavoriteArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_articles do |t|
      t.integer :article_id
      t.integer :user_id

      t.timestamps
    end
  end
end
