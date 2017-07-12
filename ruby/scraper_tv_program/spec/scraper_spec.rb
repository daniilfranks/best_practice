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

  describe '#get_program' do
    it 'uses a CSS selector to return an array of Nokogiri XML elements representing the courses described on the web page we are scraping' do
      doc = scraper.get_program

      expect(doc).to be_a(Nokogiri::XML::NodeSet)
      expect{ doc.css(".tv-channel-title__text").text }.to_not raise_error
    end
  end

  describe '#make_programs' do
    it 'class variable test' do
      Program.reset_all
      doc = scraper.make_programs

      Program.all.each do |program|
      	expect(program.id).to be_a(Integer)
        expect(program.title).to be_a(String)
        expect(program.tv_programs).to be_a(Array)
      end
    end
  end
end
