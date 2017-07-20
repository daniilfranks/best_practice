require_relative '../spec_helper'

describe 'class Tag' do
  before do
    @tag = Tag.create(name: 'ruby')
  end

  it 'has a name' do
    expect(Tag.where(name: 'ruby').first).to eq(@tag)
  end
end
