class ApplicationController < Sinatra::Base
  configure do
  	set :views, 'app/views'
  	set :public_dir, 'public'
  	use Rack::MethodOverride
  	include ApplicationHelper
  end

  get '/' do
  	erb :index
  end
end
