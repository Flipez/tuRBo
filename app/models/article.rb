class Article < ActiveRecord::Base

  belongs_to :user

  validates :title, presence: true, length: { in: 5..25 }
  validates :text, presence: true
  validates :user, presence: true

end
