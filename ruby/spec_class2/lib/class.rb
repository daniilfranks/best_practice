# class Post
class Post
  attr_accessor :title, :description
  attr_reader :id, :hash

  POSTS = []

  def initialize(id, title, description)
    @id          = id
    @title       = title
    @description = description
    @hash        = {}
  end

  def show
    "#{@id}, #{@title}, #{@description}"
  end

  def add_post
    POSTS << show unless POSTS.include?(show)
  end

  def add_hash_post(slug, title, description)
    @hash.merge!(slug => { title: title, description: description })
  end

  def show_slug(param)
    return nil unless @hash.has_key?(param)
    @hash[param]
  end
end
