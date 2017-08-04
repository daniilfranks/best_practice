class User < ActiveRecord::Base
  validates :login, presence: true, uniqueness: true, length: { minimum: 5 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }

  has_many :posts

  def self.digest(pass)
    Digest::SHA512.hexdigest(pass)
  end
end
