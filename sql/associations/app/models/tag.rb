class Tag < ActiveRecord::Base
  has_many :post_tags
  has_many :posts, through: :post_tags

  def post_count
    self.posts.count
  end

  def post_tags_count
    self.post_tags.count
  end

  def all_posts_names
    self.posts.all.collect { |a| a.name }
  end
end