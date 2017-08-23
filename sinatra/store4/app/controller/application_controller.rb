class ApplicationController < Sinatra::Base
  configure do
  	set :views, 'app/views'
  	set :public_dir, 'public'
    enable :sessions
    use Rack::Flash
  	use Rack::MethodOverride
  	include ApplicationHelper
  end

  get '/' do
    current_cart
  	erb :index
  end
end
