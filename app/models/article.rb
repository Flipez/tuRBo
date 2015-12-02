class Article < ActiveRecord::Base

  belongs_to :user

  has_many :categories

  validates :title, presence: true, length: { in: 5..25 }
  validates :text, presence: true
  validates :user, presence: true

end
