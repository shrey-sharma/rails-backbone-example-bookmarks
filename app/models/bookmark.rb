class Bookmark < ActiveRecord::Base
  attr_accessible :address, :name, :tags
  validates :name, :presence => true
  validates :address, :format => { :with => /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[.\!\/\\w]*))?)/, 
                      :message => "Invalid Address" }
end
