require 'spec_helper'

describe 'class Artist' do
  it 'has a name' do
    artist = Artist.new
    artist.name = 'Den'
    expect(artist.name).to eq('Den')
  end
end
