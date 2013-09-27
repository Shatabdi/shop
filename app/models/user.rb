class User < ActiveRecord::Base
require 'digest'
  attr_accessor :password, :password_confirmation
  attr_accessible :address, :city, :country, :dob, :email, :name, 
  				  :phone, :state, :password, :password_confirmation, :password_reset_token, :photo
  has_one :cart
  has_many :cart_items, :through => :cart
  has_attached_file :photo
  has_many :orders

  validates :name, :presence => true
  validates :email, :presence => true
  validates :phone, :presence => true
  validates :address, :presence => true
  validates :city, :presence => true
  validates :state, :presence => true
  validates :country, :presence => true
  validates :dob, :presence => true
  validates :password, :presence => true , 
                       :on => :create
  validates_confirmation_of :password 
  validates :phone, :numericality => { only_integer: true }
  validates_format_of :email, :with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i
  before_save :encrypt_password

  
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(email,submitted_password)
    user = self.where("email = ?", email).first
    if user.nil?
      return nil 
    end
    if user.has_password?(submitted_password)
     return user 
    else
      return nil
    end
  end

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end

  def reset_password_token
    #update_column(:password_reset_token, Digest::SHA2.hexdigest(Time.now.to_s))
    update_attributes(:password_reset_token => Digest::SHA2.hexdigest(Time.now.to_s), :password => '')
  end

  private

  def encrypt_password
    self.salt = make_salt if new_record?
    self.encrypted_password = encrypt(password)
  end

  def encrypt(string)
    secure_hash("#{salt}-- #{string}")
  end

  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end

end
