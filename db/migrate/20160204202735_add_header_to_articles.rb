class AddHeaderToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :header, :string
  end
end
