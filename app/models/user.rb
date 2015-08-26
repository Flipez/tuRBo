class User < ActiveRecord::Base

  has_many :articles

  has_secure_password

  validates :name, presence: true, length: { in: 3..20 }

end
