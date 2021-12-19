class CreateMates < ActiveRecord::Migration[6.1]
  def change
    create_table :mates do |t|
      t.string :name

      t.string :password

      t.timestamps
    end
  end
end
