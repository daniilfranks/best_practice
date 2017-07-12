require 'spec_helper'

describe 'class Scraper' do
  let(:scraper) { Scraper.new }

  describe '#get_page' do
    it 'uses Nokogiri to get the HTML from a web page' do
      doc = scraper.get_page

      expect{ doc }.to_not raise_error
      expect(doc).to be_a(Nokogiri::HTML::Document)
    end
  end
end
