class Album < ActiveRecord::Base
  validates :name, presence: true
  
  mount_uploaders :pictures, PictureUploader
end
