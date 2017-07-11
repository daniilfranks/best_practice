require 'spec_helper'

describe 'class Song' do
  let(:song) { Song.new }

  it 'has a title' do
    song.title = 'THE LAST SONG'
    expect(song.title).to eq('THE LAST SONG')
  end

  it 'belongs to an artist' do
    artist = Artist.new
    song.artist = artist
    expect(song.artist).to eq(artist)
  end

  it 'name of the artist it belongs to' do
    artist = Artist.new
    artist.name = 'Oskar'
    song.artist = artist
    expect(song.artist.name).to eq('Oskar')
  end
end
