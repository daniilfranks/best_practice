class User < ActiveRecord::Base
  has_secure_password

  validates :login, presence: true
  validates :password_digest, presence: true
end
