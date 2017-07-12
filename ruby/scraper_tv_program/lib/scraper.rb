require 'nokogiri'
require 'open-uri'
require_relative './program'

class Scraper
  def get_page
    Nokogiri::HTML(open("https://tv.yandex.ru/43?grid=main&period=all-day"))
  end

  def get_program
    get_page.css(".tv-grid__item.tv-grid__item_is-now_no")
  end

  def make_programs
    index = 0

    get_program.each do |channel|

      title = channel.css(".tv-channel-title__text").text

      show = []
      text = channel.css(".tv-channel-events__item")
      text.each do |text|
        show << [
      	          text.css(".tv-event__time-text").text, 
      	          text.css(".tv-event__title-inner").text
                ]
      end
    
      index += 1

      program             = Program.new
      program.id          = index
      program.title       = title
      program.tv_programs = show
    end
  end

  def make_programs2
    hash  = {}
    index = 0

    get_program.each do |channel|

      title = channel.css(".tv-channel-title__text").text

      show = []
      text = channel.css(".tv-channel-events__item")
      text.each do |text|
        show << [
      	          text.css(".tv-event__time-text").text, 
      	          text.css(".tv-event__title-inner").text
                ]
      end
    
      index += 1
      hash.merge!( index => { channel: title, show: [show] })
    end
    hash
  end
end
