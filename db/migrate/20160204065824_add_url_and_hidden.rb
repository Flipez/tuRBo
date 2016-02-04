class AddUrlAndHidden < ActiveRecord::Migration
  def change
    add_column :articles, :hidden, :boolean
    add_column :articles, :url, :string
  end
end
