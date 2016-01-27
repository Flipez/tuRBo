class AddPicturesToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :pictures, :json
  end
end
