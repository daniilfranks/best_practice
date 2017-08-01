class StaticPagesController < ApplicationController
  get '/' do
  	@title = 'Home page'
    erb :'/static_pages/index'
  end

  get '/about' do
  	@title = 'About'
    erb :'/static_pages/about'
  end
end
