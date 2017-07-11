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

  context '#add_hash_post' do
    it 'add post in hash' do
      first.add_hash_post('ruby', 'First title', 'text description')
      expect(first.hash).to eq("ruby" => {:title=>"First title", :description=>"text description"})
    end

    it 'count elements in hash' do
       first.add_hash_post('ruby', 'First title', 'text description')
       first.add_hash_post('php', 'Second title', 'text')

       expect(first.hash.size).to eq(2)
    end
  end

  context '#show_slug' do
    it 'show 1 element in hash' do
      first.add_hash_post('ruby', 'First title', 'text description')
      expect(first.show_slug('ruby')).to eq({:title=>"First title", :description=>"text description"})
    end

    it 'show nil' do
      first.add_hash_post('ruby', 'First title', 'text description')
      expect(first.show_slug('php')).to be_nil
    end
  end
end
