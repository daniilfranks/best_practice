class ApplicationController < Sinatra::Base
  configure do
  	set :views, 'app/views'
  	set :public_dir, 'public'
  end

  get '/' do
  	erb :'index'
  end

  get '/form' do
    erb :'form'
  end

  post '/hello' do
    @hello = params['hello']
    erb :'hello'
  end

  get '/hello' do
    erb :'hello'
  end
end
