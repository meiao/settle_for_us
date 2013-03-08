class FavoritesHabtm < ActiveRecord::Migration
  def change

    add_column :favorites, :name, :string
    add_column :favorites, :canonicalUrl, :string
    add_column :favorites, :address, :string

    Favorite.all.each do |f|
      user = User.find(f.user_id)
      user.favorites << f
    end
    
    
    remove_index :favorites, :user_id
    remove_index :favorites, [:user_id, :venue_id]
    remove_column :favorites, :user_id
    
    add_index(:favorites, [:venue_id], :unique => true)

    create_table :favorites_users, :id => false do |t|
      t.integer :user_id
      t.integer :favorite_id
    end
    
    add_index(:favorites_users, [:user_id])
  end
end
