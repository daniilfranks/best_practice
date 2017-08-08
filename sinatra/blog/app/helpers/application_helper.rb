module ApplicationHelper
  def current_user
    #@current_user ||= User.find_by(id: session[:user_id])
    @current_user ||= read_cookies
  end

  def logged_in?
    !current_user.nil?
  end

  def user_id_params
    params.merge!({ user_id: current_user.id })
  end

  def log_in(user)
  	session[:user_id] = user.id
  end

  def log_out
    #session.delete(:user_id)
    current_user.forget
    response.delete_cookie('user_id')
    response.delete_cookie('remember_digest')
    @current_user = nil
  end

  def hide_page
    redirect to '/' unless logged_in?
  end

  def write_cookies(user)
    response.set_cookie('remember_digest', value: Base64.encode64(user.remember_digest), 
                                           expires: Time.now + 2592000)

    response.set_cookie('user_id', value: Base64.encode64(user.id.to_s), 
                                   expires: Time.now + 2592000)
  end

  def read_cookies
    user_id = request.cookies['user_id']
    user_id = Base64.decode64(request.cookies['user_id'].nil? ? '' : user_id.to_s)

    remember_digest = request.cookies['remember_digest']
    remember_digest = Base64.decode64(request.cookies['remember_digest'].nil? ? '' : remember_digest)

    user = User.find_by_id(user_id)
    user && user.remember_digest == remember_digest ? user : nil
  end
end
