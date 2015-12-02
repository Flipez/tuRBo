class ArticleHasManyCategories < ActiveRecord::Migration
  def change
 		create_table :orders do |t|
      t.belongs_to :customer, index:true
    end 
  end
end
