class User < ActiveRecord::Base
  attr_accessor :remember_token

  validates :login, presence: true, uniqueness: true, length: { minimum: 5 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }

  has_many :posts

  def self.authenticate(login, password)
    user = self.find_by_login(login)
    user && user.password == BCrypt::Engine.hash_secret(password, user.salt) ? user : nil
  end

  def self.encrypt_password(password)
    password_salt = BCrypt::Engine.generate_salt
    password_hash = BCrypt::Engine.hash_secret(password, password_salt)

    { password_salt: password_salt, password_hash: password_hash }
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def session_token
    self.session_token = User.new_token
    update_attribute(:session_digest, User.digest(session_token))
  end
end
