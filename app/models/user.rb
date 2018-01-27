class User < ActiveRecord::Base
  validates_presence_of :email, :full_name, :password
  validates_uniqueness_of :email
  validates :password, length: { minimum: 8}

  has_many :reviews
  
  has_secure_password
end
