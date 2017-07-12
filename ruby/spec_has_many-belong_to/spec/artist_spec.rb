require 'spec_helper'

describe 'class Artist' do
  let(:dany) { Artist.new('Dany') }

  context '#new' do
    it 'is initialized name' do
      expect{ dany }.to_not raise_error
    end

    it 'array songs is empty' do
      expect(dany.songs).to eq([])
    end
  end

  context '#name' do
  	it 'has a attr_acessor name' do
      artist = Artist.new('Dany')
      expect(artist.name).to eq('Dany')
    end
  end

  context '#songs' do
    it 'has a attr_acessor songs' do
      expect(dany.songs).to be_a(Array)
    end
  end

  context '#add_song' do
    it 'add song to array songs' do
      the_last = Song.new('The last song')
      dany.add_song(the_last)

      expect(dany.songs).to include(the_last)
      expect(the_last.artist).to eq(dany)
    end
  end

  context '#add_song_by_name' do
    it 'add song to array by name' do
      dany.add_song_by_name('if only you')

      expect(dany.songs.last.name).to eq('if only you')
      expect(dany.songs.last.artist).to eq(dany)
    end
  end

  context '.song_count' do
   it 'type variable method integer?' do
     expect(Artist.class_variable_get(:@@song_count)).to be_a(Integer)
   end

    it 'count artists in variable class method @@song_count' do
      expect(Artist.song_count).to eq(2)
    end
  end
end
