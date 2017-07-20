require_relative '../spec_helper'

describe 'class Tag' do
  before do
    @tag = Tag.create(name: 'ruby')
  end

  it 'has a name' do
    expect(Tag.where(name: 'ruby').first).to eq(@tag)
  end

  it 'has many post_tags' do
    @tag.post_tags << PostTag.create(name: 'languages')
    @tag.save

    found_post_tag = PostTag.find_by(name: 'languages')

    expect(found_post_tag.tag).to eq(@tag)
  end

  it 'it also association with an post' do
    post = Post.create(name: 'First post')
    post_tag = PostTag.create(name: 'languages', tag: @tag)
    post.post_tags << post_tag
    post.save

    expect(@tag.posts).to include(post)
  end
end
