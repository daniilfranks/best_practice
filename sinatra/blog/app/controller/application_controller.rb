class ApplicationController < Sinatra::Base
  configure :development do

  end
  
  configure do
  	set :views, 'app/views'
  	set :public_dir, 'public'
    enable :sessions
    register Sinatra::Namespace
    use Rack::MethodOverride
    use Rack::Flash
    use Rack::Csrf, :raise => true
    register Sinatra::StrongParams
    register Sinatra::Partial
    helpers WillPaginate::Sinatra::Helpers
    include Recaptcha::ClientHelper
    include Recaptcha::Verify
    enable :partial_underscores
    set :partial_template_engine, :erb
    include ApplicationHelper
    include Sinatra::Cookies

    #on error page
    set :show_exceptions, false
  end

  #not_found do
  #  erb :'404'
  #end

  #error do
  #  erb :'error'
  #end
end
