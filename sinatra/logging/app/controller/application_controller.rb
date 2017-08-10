class ApplicationController < Sinatra::Base
  configure do
  	set :views, 'app/views'
  	set :public_dir, 'public'
  	enable :sessions
  	set :session_secret, "secret"
  	use RackSessionAccess if environment == :test
  	use Rack::MethodOverride
  end
  include ApplicationHelper

  # home page
  get '/' do
    erb :'index'
  end

  # Sign up
  get '/sign_up' do
    erb :'sign_up'
  end

  post '/sign_up' do
    user = User.new(login: params['login'], password: params['password'])

    if user.save
      log_in(user)
      redirect '/'
    else
      erb :'sign_up'
    end
  end

  # Sign in
  get '/sign_in' do
    erb :'sign_in'
  end

  post '/sign_in' do
    user = User.find_by_login(params['login'])

    if user && user.authenticate(params['password'])
      log_in(user)
      redirect '/'
    else
      erb :'sign_in'
    end
  end

  # Logout
  delete '/logout' do
    log_out
    redirect '/'
  end

  #Profile

  get '/profile' do
  	hide_page
    erb :'profile'
  end
end
