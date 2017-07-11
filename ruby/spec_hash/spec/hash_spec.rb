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
end
