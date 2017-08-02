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
  end

  #helpers
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
end
