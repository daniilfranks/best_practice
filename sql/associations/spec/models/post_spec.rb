require_relative '../spec_helper'

describe 'class Post' do
  before do
    @post = Post.create(name: 'First post')
  end

  it 'has a name' do
    expect(Post.where(name: 'First post').first).to eq(@post)
  end

  it 'can build a post_tags' do
    post_tag = @post.post_tags.build(name: 'languages')
    post_tag.save

    expect(@post.post_tags).to include(post_tag)
  end

  it 'can create a post_tags' do
    post_tag = @post.post_tags.create(name: 'phones')

    expect(@post.post_tags).to include(post_tag)
  end

  it 'knows about post_tags that are affiliated with it' do
    post_tag = PostTag.create(name: 'languages', post: @post)

    expect(@post.post_tags).to include(post_tag)
  end

  it 'can add many posts at the time' do
    post_tag1 = PostTag.create(name: 'languages')
    post_tag2 = PostTag.create(name: 'phones')
    @post.post_tags << [post_tag1, post_tag2]

    expect(Post.find_by(name: 'First post').post_tags.count).to eq(2)
  end

  it 'knows about its post_tags' do
    post_tag = PostTag.create(name: 'languages')
    tag = Tag.create(name: 'ruby')
    post_tag.tag = tag
    post_tag.save
    @post.post_tags << post_tag

    expect(@post.tags).to include(tag)
  end
end
