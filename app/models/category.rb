class Category < ActiveRecord::Base
  attr_accessible :name, :photo
  validates :name, :presence => true
  	has_many :products
  	has_attached_file :photo
end
