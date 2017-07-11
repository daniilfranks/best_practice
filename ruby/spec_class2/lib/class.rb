# class Post
class Post
  attr_accessor :title, :description
  attr_reader :id

  POSTS = []

  def initialize(id, title, description)
    @id          = id
    @title       = title
    @description = description
  end

  def show
    "#{@id}, #{@title}, #{@description}"
  end

  def add_post
    POSTS << show unless POSTS.include?(show)
  end
end
