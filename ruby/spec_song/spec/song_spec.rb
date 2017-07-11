require 'spec_helper'
require_relative '../lib/song.rb'

describe 'class Song' do
  context '.create' do
    it 'initialize object and save the song' do
      song = Song.create(name: 'Deny', artist_name: 'THE SONG')

      expect(song).to be_a(Song)
      expect(Song.all).to include(song)
    end
  end

  context '.new_by_name' do
  	it 'initialize name' do
      song = Song.new_by_name('Deny')

      expect(song.name).to eq('Deny')
    end
  end

  context '.create_by_name' do
  	it 'create name' do
      song = Song.create_by_name('Deny')

      expect(song.name).to eq('Deny')
      expect(Song.all).to include(song)
    end
  end

  context '.find_by_name' do
  	it 'search name' do
      song = Song.create_by_name('Jok')

      expect(Song.find_by_name('Jok')).to eq(song)
    end
  end

  context '.destroy_all' do
    it 'clear array @@all' do
      Song.destroy_all
      expect(Song.all).to eq([])
    end
  end
end
