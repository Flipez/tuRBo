class Article < ActiveRecord::Base

  mount_uploader :header, HeaderUploader

  belongs_to :category
  belongs_to :user

  has_many :comments

  is_impressionable
  
  acts_as_taggable

  validates :title, presence: true, length: { minimum: 5 }
  validates :text, presence: true
  validates :user, presence: true
  validates :category, presence: true

end
