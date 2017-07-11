require 'spec_helper'

describe 'class Post' do
  let(:post) { Post.new }

  it 'has a title' do
    post.title = 'First post'
    expect(post.title).to eq('First post')
  end

  it 'belongs to an author' do
    author = Author.new
    post.author = author
    expect(post.author).to eq(author)
  end

  it 'name of the author it belongs to' do
    author = Author.new
    author.name = 'Leo'
    post.author = author
    expect(post.author.name).to eq('Leo')
  end
end
