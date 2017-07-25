require 'spec_helper'

describe 'class App' do
  it 'return page / adn read text' do
    get '/'
    expect(last_response.body).to include('Hello app!')
  end
end
