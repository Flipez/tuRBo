class Category < ActiveRecord::Base

  acts_as_taggable
  acts_as_taggable_on :acticles

end
