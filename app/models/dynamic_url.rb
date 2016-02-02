class DynamicUrl < ActiveRecord::Base

  validates :url, presence: true
  validates :title, presence: true
  validates :subtitle, presence: true

end
