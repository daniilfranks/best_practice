require_relative '../spec_helper'

describe 'class Post' do
  before do
    @post = Post.create(name: 'First post')

    @first = Post.create(name: 'My first post')
    tag = Tag.create(name: 'ruby')
    post_tags = PostTag.create(name: 'languages')
    
    tag.post_tags << post_tags
    tag.save
    @first.tags << tag
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

  context '.get_first_post_tags' do
    it 'return first get_first_post_tags' do
      expect(@first.get_first_post_tags).to eq(2)
    end
  end

  context '.tags_count' do
    it 'return cout tags' do
      expect(@first.tags_count).to eq(1)
    end
  end

  context '.post_tags_count' do
    it 'return cout post_tags' do
      expect(@first.post_tags_count).to eq(1)
    end
  end
end
