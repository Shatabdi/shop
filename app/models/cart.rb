class Cart < ActiveRecord::Base
  attr_accessible :session_id
  has_many :cart_items, :dependent => :destroy
  belongs_to :user

end
