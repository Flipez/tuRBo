class AddNameToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :name, :string
  end
end
