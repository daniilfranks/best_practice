require_relative '../spec_helper'

describe 'class post_tag' do
  before do
    @post_tag = PostTag.create(name: 'languages')
  end

  it 'has a name' do
    expect(PostTag.where(name: 'languages').first).to eq(@post_tag)
  end

  it 'has a post_tag' do
    tag = Tag.create(name: 'ruby')
    @post_tag.tag = tag
    @post_tag.save

    expect(PostTag.find_by(name: 'languages').tag).to eq(tag)
  end

  it 'has a post' do
    post = Post.create(name: 'First post')
    @post_tag.post = post
    @post_tag.save

    expect(PostTag.where(name: 'languages').first.post).to eq(post)
  end

  it 'can build tag' do
    tag = @post_tag.build_tag(name: 'ruby')
    @post_tag.save

    expect(PostTag.where(name: 'languages').first.tag).to eq(tag)
    expect(Tag.where(name: 'ruby').first.post_tags).to include(@post_tag)
  end
end
