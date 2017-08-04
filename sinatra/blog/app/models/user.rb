class User < ActiveRecord::Base
  attr_accessor :remember_token

  validates :login, presence: true, uniqueness: true, length: { minimum: 5 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }

  has_many :posts

  def self.digest(password)
    Digest::SHA512.hexdigest(password)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def session_token
    self.session_token = User.new_token
    update_attribute(:session_digest, User.digest(session_token))
  end
end
