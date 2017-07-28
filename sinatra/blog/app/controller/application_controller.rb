class ApplicationController < Sinatra::Base
  configure do
  	set :views, 'app/views'
  	set :public_dir, 'public'

    use Rack::Session::Cookie, :key => 'rack.session',
                               :expire_after => 2592000,
                               :secret => 'a1v1F0O8xE7zA293lJ6cN1'
  end

  get '/' do
  	erb :index
  end
end
