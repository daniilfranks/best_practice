class User < ActiveRecord::Base
  attr_accessor :text

  def initialize(text)
    @text = text
  end

  def count_words
    @text.split(' ').count
  end

  def self.hello
    'Hello'
  end
end
