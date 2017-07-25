class Post < ActiveRecord::Base
  has_many :post_tags
  has_many :tags, through: :post_tags

  def get_first_post_tags
    self.post_tags.first.post_id
  end

  def tags_count
    self.tags.count
  end

  def post_tags_count
    self.post_tags.count
  end
end