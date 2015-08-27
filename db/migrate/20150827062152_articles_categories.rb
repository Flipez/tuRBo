class ArticlesCategories < ActiveRecord::Migration

  def self.up
    create_table 'articles_categories', id: false do |t|
      t.column :article_id, :integer
      t.column :category_id, :integer
    end
  end

end
