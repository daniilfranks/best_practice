require_relative '../spec_helper'

describe 'class Tag' do
  before do
    @tag = Tag.create(name: 'ruby')
    @tag.posts << Post.create(name: 'My post')
    @tag.posts << Post.create(name: 'Second post')
    @tag.posts << Post.create(name: 'Ruby on Rails doc')
    @tag.save
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

  context '.post_count' do
    it 'coutn posts' do
      expect(@tag.post_count).to eq(3)
    end
  end

  context '.post_tags_count' do
    it 'coutn post_tags' do
      @tag.post_tags << PostTag.create(name: 'Tests')
      @tag.save

      expect(@tag.post_tags_count).to eq(4)
    end
  end

  context '.all_posts_names' do
    it 'collect posts name' do
      expect(@tag.all_posts_names).to eq(["My post", "Second post", "Ruby on Rails doc"])
    end
  end
end
