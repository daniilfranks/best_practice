require_relative '../spec_helper'

describe 'class post_tag' do
  before do
    @post_tag = PostTag.create(name: 'languages')
  end

  it 'has a name' do
    expect(PostTag.where(name: 'languages').first).to eq(@post_tag)
  end
end
