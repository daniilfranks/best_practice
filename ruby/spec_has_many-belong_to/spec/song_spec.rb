require 'spec_helper'

describe 'class Song' do
  let(:song) { Song.new('the last song') }

  context '#new' do
    it 'is initialized with an argument of a name' do
      expect{ song }.to_not raise_error
    end
  end

  context '#name' do
    it 'has a name' do
      expect(song.name).to eq('the last song')
    end
  end

  context '#artist' do
    it 'belongs to an artist' do
      artist = Artist.new('Deny')
      song.artist = artist

      expect(song.artist).to eq(artist)
    end
  end

  context '#artist_name' do
    it 'name of the artist it belongs to' do
      oskar = Artist.new('Oskar')
      song.artist = oskar

      expect(song.artist_name).to eq('Oskar')
    end

    it 'return nil' do
      expect(song.artist_name).to be_nil
    end
  end
end
