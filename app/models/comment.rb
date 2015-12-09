class Comment < ActiveRecord::Base

  belongs_to :article

  validates :title, presence: true, length: { maximum: 25 }

end
