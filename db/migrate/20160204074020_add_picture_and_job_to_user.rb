class AddPictureAndJobToUser < ActiveRecord::Migration
  def change
    add_column :users, :image_url, :string
    add_column :users, :job, :string
  end
end
