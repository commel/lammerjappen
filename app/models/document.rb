class Document < ActiveRecord::Base
  belongs_to :user
  
  has_attached_file :asset, :path => ":rails_root/tmp/uploads/:attachment/:id/:filename"
  
  validates_attachment_presence :asset

end
