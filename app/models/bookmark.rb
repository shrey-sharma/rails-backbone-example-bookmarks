class Bookmark < ActiveRecord::Base
  attr_accessible :address, :name, :tags
end
