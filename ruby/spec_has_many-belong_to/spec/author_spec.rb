require 'spec_helper'

describe 'class Author' do
  it 'has a name' do
    author = Author.new
    author.name = 'Den'
    expect(author.name).to eq('Den')
  end
end
