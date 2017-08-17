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
  	erb :index
  end

  def initialize_cart
    @cart = Cart.build_from_hash(session)
  end
end
