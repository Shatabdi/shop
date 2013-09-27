class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :photo, :quantity
  validates :name, :presence => true
  validates :price, :presence => true
  validates :price, :numericality => { only_integer: true }
  belongs_to :category
  has_many :cart_items
  has_many :order_items
  has_attached_file :photo
end
