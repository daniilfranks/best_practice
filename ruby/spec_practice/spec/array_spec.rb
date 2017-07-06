require 'spec_helper'
require_relative '../lib/array.rb'

describe 'Test array method' do
  it 'No nil' do
    expect(resault).to_not be_nil
  end

  it 'array ?' do
    expect(resault).to be_a(Array)
  end

  it 'array count' do
    expect(resault.size).to eq(4)
  end

  it 'match array' do
    expect(resault).to match_array(%w[car book phone tv])
  end

  it 'test index element array' do
    expect(resault[2]).to eq('phone')
  end

  it 'include' do
    expect(resault).to include('car')
    expect(resault).to include('car', 'tv')
  end
end

describe 'Test method languages' do
  it 'add languages' do
    lang = languages('ruby', 'php', 'js')
    expect(lang).to match_array(%w[ruby php js])
  end
end

describe 'Test method hello' do
  it 'defined method?' do
    expect(defined?(hello)).to be_truthy
  end

  it 'not raise' do
    expect{ hello }.to_not raise_error
  end

  it 'include name' do
    expect(hello).to include('Den')
  end

  it 'default name' do
    expect(hello).to eq('Hello, Den')
  end

  it 'name Carl' do
    expect(hello('Carl')).to eq('Hello, Carl')
  end
end

describe 'Test method role' do
  it 'fail role' do
    expect(role(-1)).to eq('No valid role')
  end

  it 'User role' do
    expect(role(2)).to eq('User')
  end

  it 'Moderator role' do
    expect(role(9)).to eq('Moderator')
  end
end
