class Article < ActiveRecord::Base

  belongs_to :user

  is_impressionable
  
  acts_as_taggable

  belongs_to :category

  validates :title, presence: true, length: { minimum: 5 }
  validates :text, presence: true
  validates :user, presence: true

end
