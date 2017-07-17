require 'spec_helper'

describe 'class User' do
  context '#all' do
  	it 'not raise error' do
      expect{ User.all }.to_not raise_error
  	end

    it 'Extract all users from db' do
      expect(User.all.size).to eq(8)
    end

    it 'views first user' do
      expect(User.all[0].name).to eq("Den")
    end
  end

  context '#find_by_name' do
    it 'method find name in db' do
      expect(User.find_by_name('Den')).to eq([1, "Den", 7, 319, 98])
    end
  end
end
