class ApplicationController < Sinatra::Base
  configure do
  	set :views, 'app/views'
  	set :public_dir, 'public'

    use Rack::Session::Cookie, :key => 'rack.session',
                               :expire_after => 2592000,
                               :secret => SecureRandom.hex(64)
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
    redirect to '/tests'
  end
end
