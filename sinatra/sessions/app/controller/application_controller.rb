class ApplicationController < Sinatra::Base
  configure do
  	set :views, 'app/views'
  	set :public_dir, 'public'

    use Rack::Session::Cookie, :key => 'rack.session',
                               :expire_after => 2592000,
                               :secret => 'a1v1F0O8xE7zA293lJ6cN1'
  end

  USER = { user_id: 1, email: 'babanovs5@gmail.com', password: 12345 }

  # redirect
  def curent_user
    redirect '/' unless session[:user_id].nil?
  end

  def authorized
    redirect '/sign_in' if session[:user_id].nil?
  end

  get '/' do
  	erb :index
  end

  get '/tests' do
    erb :'tests/index'
  end

  get '/tests/new' do
    erb :'tests/new'
  end

  post '/tests' do
    session[:login] = params['test']['login']
    redirect '/tests'
  end

  # Sign in
  get '/sign_in' do
    curent_user
    erb :'users/sign_in'
  end

  post '/sign_in' do
    user_id = params['user']['user_id']
    email = params['user']['email']
    password = params['user']['password']

    if USER[:user_id] == user_id && USER[:email] == email && USER[:password] == password
      redirect '/sign_in'
    else
      session[:user_id] = params['user']['user_id']
      redirect '/'
    end
  end

  # Sign up
  get '/sign_up' do
    curent_user
    erb :'users/sign_up'
  end

  post '/sign_up' do
    session[:user_id] = params['user']['user_id']

    redirect '/'
  end

  get '/logout' do
    session.clear

    redirect '/'
  end

  get '/private' do
    authorized
    erb :'/private'
  end
end
