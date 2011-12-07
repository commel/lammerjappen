class Document < ActiveRecord::Base
  belongs_to :user
  
  has_attached_file :asset
  
  validates :asset, :presence => true
  
  
end
