require 'spec_helper'
require_relative '../lib/reg.rb'

describe 'Regular expressions' do
  context '#reg_base?' do
    it 'string true' do
      expect(reg_base?('apple')).to be(true)
    end

    it 'string false' do
      expect(reg_base?('php')).to be(false)
    end
  end

  context '#reg_scan' do
    it 'search word in string' do
      string = 'asd_ruby its work'
      expect(reg_scan(string)[0].size).to eq(8)
      expect(reg_scan(string)).to include('asd_ruby')
      expect(reg_scan(string)).not_to include('ruby')
    end
  end

  context '#reg_five' do
    it 'search 5word in string' do
      string = 'apple'
      expect(reg_five(string)[0].size).to eq(5)
      expect(reg_five(string)).to include('apple')
      expect(reg_five('ruby')).to eq([])
    end
  end
end
