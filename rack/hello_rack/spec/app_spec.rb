require 'spec_helper'

describe 'class App' do
  def app
    App.new
  end

  it 'return page / adn read text' do
    get '/'
    expect(last_response.body).to include('Hello app!')
    expect(last_response.status).to be(200)
  end

  it 'return items' do
    get '/items'
    expect(last_response.body).to include("apple\nbook\ncar")
    expect(last_response.status).to be(200)
  end

  it 'not page' do
    get '/404' do
      expect(last_response.body).to include('404')
      expect(last_response.status).to be(404)
    end
  end
end
