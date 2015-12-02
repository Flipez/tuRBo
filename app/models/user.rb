class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true, length: { in: 3..20 }
end
