class UsersAndMates < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :mate_id
    add_column :comments, :user_id, :reference
  
  end
end
