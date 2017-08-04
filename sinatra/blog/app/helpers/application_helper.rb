module ApplicationHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
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
    session.delete(:user_id)
  end

  def hide_page
    redirect to '/' unless logged_in?
  end
end