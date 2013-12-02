class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_secure_password
  validates :email, uniqueness: true, format:{ with: VALID_EMAIL_REGEX }
  validates :name,   presence: true
  validates :password, length: {minimum: 6}

end
