class Item < ActiveRecord::Base
   has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" },
                                          :url => "/images/items/:id/:style/:basename.:extension",
                                          :path => ":rails_root/public/images/items/:id/:style/:basename.:extension"

  validates_attachment_presence :image

end
