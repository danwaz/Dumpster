class Item < ActiveRecord::Base
   has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" },
                                          :url => "/images/items/:id/:style/:basename.:extension",
                                          :path => ":rails_root/public/images/items/:id/:style/:basename.:extension"
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  
  validates :header, :desc, :dim, :presence => true
  
  
end
