class UsersController < ApplicationController
  # Namespace
  namespace '/users' do
  	# Show all users
    get do
      erb :'users/index'
    end
  end

  # Sign up
  get '/sign_up' do
    erb :'users/sign_up'
  end

  post '/sign_up' do
  	login = params[:login]
  	email = params[:email]
  	password = Digest::SHA512.hexdigest(params[:password])

    @user = User.new(login: login, email: email, password: password )
      
    if @user.save && verify_recaptcha(model: @user)
      flash[:notice] = 'User successfully created.'
      redirect '/'
    else
      flash[:error] = @user.errors.full_messages
      redirect '/sign_up'
    end
  end

  # Sign in
  get '/sign_in' do
    erb :'users/sign_in'
  end

  post '/sign_in' do
    login = params[:login]
  	password = Digest::SHA512.hexdigest(params[:password])
    @user = User.find_by(login: login, password: password)

    if @user.nil?
      flash[:notice] = 'Invalid email/password'
      redirect '/sign_in'
    else
      flash[:notice] = 'Successfully log in.'
      session[:user_id] = @user.id
      redirect '/'
    end
  end

  # Logout
  get '/logout' do
    session.clear
    redirect '/'
  end
end