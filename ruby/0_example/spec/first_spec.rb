require 'spec_helper'
require_relative '../lib/first.rb'

describe 'Hello world' do
  it 'Method first. Displays hello world.' do
    expect(first).to eq('Hello world')
  end
end
