class ApplicationController < Sinatra::Base
  configure do
  	set :views, 'app/views'
  	set :public_dir, 'public'
  end

  get '/' do
  	erb :index
  end

  get '/forms/:name' do
    erb :"forms/#{params[:name]}"
  end

  post '/forms/:name' do
    params['contact'].inspect
  end

  get '/posts/new' do
    erb :'posts/new'
  end

  get '/posts/show' do
    erb :'posts/show'
  end

  post '/posts/new' do
    @text = User.new(params['post']['text'])
    erb :'posts/show'
  end

  get '/hello' do
    User.hello
  end
end
