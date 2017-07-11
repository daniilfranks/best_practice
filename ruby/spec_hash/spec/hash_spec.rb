require 'spec_helper'
require_relative '../lib/hash.rb'

describe 'hash' do
  context '#my_hash' do
    it 'hash empty' do
      expect(my_hash).to be_a(Hash)
      expect(my_hash.keys.count).to_not eq(0)
    end

    it 'keys/values count' do
      expect(my_hash.keys).to match_array([:name, :age])
      expect(my_hash.values).to match_array(['Den', 26])
    end
  end

  context '#show_hash' do
    it 'show value name' do
      expect(show_hash).to eq('Den')
    end
  end

  context '#update_name_hash' do
    it 'update value name' do
      expect(update_name_hash('Alan')).to include(name: 'Alan', age: 26)
    end
  end

  context '#hash_each' do
    it 'each hash' do
      hash = { 'Den' => 26, 'Leo' => 31 }
      expect{ hash_each(hash) }.to output("Hello, name: Den, age: 26.\nHello, name: Leo, age: 31.\n").to_stdout
    end
  end

  context 'all_post' do
    it 'keys' do
      expect(all_posts.keys).to eq([1,2,3])
    end

    it 'cout keys' do
      expect(all_posts.keys.count).to eq(3)
    end

    it 'has_key?' do
      expect(all_posts[1].has_key?(:title)).to be true
    end

    it '1 keys' do
      expect(all_posts[1].keys).to eq(%i[title tags user_id comments])
    end

    it '1 values' do
      expect(all_posts[1][:title]).to eq('First post')
    end

    it 'all 1 values' do
       expect(all_posts[1].values).to eq(["First post",["first", "post"], 1, [{ :body=>"First comment", :user_id=>1 }, { :body=>"Good post!", :user_id=>4 }]])
    end

    it 'all 2 values' do
       expect(all_posts[2].values).to eq(["Second post", ["second", "post"], 1])
    end

    it '1 values comments' do
      expect(all_posts[1][:comments][0].values).to eq(["First comment", 1])
    end

    it 'tags' do
      expect(all_posts[1][:tags]).to eq(%w[first post])
    end

    it 'include tags' do
      expect(all_posts[1][:tags]).to include('first')
    end

    it 'not tags' do
      expect(all_posts[1][:tags]).to_not include('ruby')
    end

    it 'match array' do
      expect(all_posts[1][:comments]).to match_array([{:body=>"First comment", :user_id=>1}, {:body=>"Good post!", :user_id=>4}])
    end
  end
end
