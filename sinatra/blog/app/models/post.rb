class Post < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true
  validates :user_id, presence: true
end
