require_relative '../spec_helper'

describe 'static pages controller' do
  it '/static_pages redirect to / status 200' do
    get '/'
    expect(last_response.status).to eq(200)
  end

  it '/static_pages / return text' do
    get '/'
    expect(last_response.body).to include('Home page')
  end

  it 'return title text in page /' do
    get '/'
    expect(last_response.body).to include('<title>Home page</title>')
  end

  it '/static_pages/ status 200' do
    get '/about'
    expect(last_response.status).to eq(200)
  end

  it '/static_pages/about return text' do
    get '/about'
    expect(last_response.body).to include('About')
  end

  it 'return title text in page /about' do
    get '/about'
    expect(last_response.body).to include('<title>About</title>')
  end
end