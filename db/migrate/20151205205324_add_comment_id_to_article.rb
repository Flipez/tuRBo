class AddCommentIdToArticle < ActiveRecord::Migration
  def change
  
    add_column :articles, :comment_id, :integer

  end
end
