class CreateDynamicUrls < ActiveRecord::Migration
  def change
    create_table :dynamic_urls do |t|
      t.string :url
      t.string :title
      t.string :subtitle

      t.timestamps null: false
    end
  end
end
