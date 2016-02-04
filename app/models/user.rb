class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  
  has_secure_password

  has_many :articles

  validates :name, presence: true, length: { in: 3..20 }
  validates :avatar, file_size: { less_than: 1.megabytes }
end
