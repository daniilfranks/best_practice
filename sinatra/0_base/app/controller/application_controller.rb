class ApplicationController < Sinatra::Base
  configure do
  	set :views, 'app/views'
  	set :public_dir, 'public'
  end

  get '/' do
  	erb :index
  end

  get '/hello' do
    'Hello world'
  end

  get "/hello/:name" do
    @name = params[:name]
    "Hello, #{@name}"
  end

  get "/integer/:num1/:num2" do
    num1 = params[:num1].to_i
    num2 = params[:num2].to_i

    "#{num1 * num2}"
  end

  get '/form' do
    erb :'form'
  end

  post '/form' do
    "My name, #{params[:name]}"
  end

  get '/users' do
    @users = [['Den', 26], ['Leo', 30], ['Mark', 33]]
    erb :'users/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    @name = params['users']['name']
    @age = params['users']['age']

    erb :'users/show'
  end

  get '/users/:name' do
    erb :'users/show'
  end
end
