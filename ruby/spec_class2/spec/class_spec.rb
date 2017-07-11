require 'spec_helper'
require_relative '../lib/class.rb'

describe 'class Post' do
  let(:first) { Post.new(1, 'First post', 'text description') }

  context 'initialize' do
    it 'instantiates a new post' do
      expect{ first }.to_not raise_error
      expect(first).to be_a(Post)
    end
  end

  context 'has a id' do
    it 'call instance variable id' do
      expect(first.id).to eq(1)
    end
  end

  context 'has a titile' do
    it 'call instance variable title' do
      expect(first.title).to eq('First post')
    end
  end

  context 'has a description' do
    it 'call instance variable description' do
      expect(first.description).to eq('text description')
    end
  end

  context '#show' do
  	it 'show resault method show' do
      expect(first.show).to eq('1, First post, text description')
    end
  end

  context 'has a constant POSTS' do
    it 'POSTS empty?' do
      expect(Post::POSTS).to be_empty
    end
  end

  context '#add_post' do
    it 'add post in constant posts' do
      first.add_post
      expect(Post::POSTS).to include('1, First post, text description')
    end

    it 'uniq posts in constants POSTS' do
      Post::POSTS.clear
      3.times { first.add_post }
      expect(Post::POSTS.size).to eq(1)
    end
  end
end
