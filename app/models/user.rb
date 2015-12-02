class User < ActiveRecord::Base
  has_secure_password

  has_many :articles

  validates :name, presence: true, length: { in: 3..20 }
end
