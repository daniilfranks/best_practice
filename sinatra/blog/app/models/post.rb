class Post < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 5, maximum: 50 }
  validates :description, presence: true, length: { minimum: 5, maximum: 2000 }
  validates :user_id, presence: true

  belongs_to :user
end
