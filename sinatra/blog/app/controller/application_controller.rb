class ApplicationController < Sinatra::Base
  configure do
  	set :views, 'app/views'
  	set :public_dir, 'public'

    use Rack::Session::Cookie, :key => 'rack.session',
                               :expire_after => 2592000,
                               :secret => 'jd0ng+#kwr4^NbK|H7BJm#f?T@g:EgL2'
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
  end
end
