class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :venue_id
      t.integer :user_id
      t.timestamps
    end
    
    add_index(:favorites , [:user_id])
    add_index(:favorites, [:user_id, :venue_id], :unique => true)
  end
end
