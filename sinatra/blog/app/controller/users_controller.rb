class UsersController < ApplicationController
  # Namespace
  namespace '/users' do
  	# Show all users
    get do
      erb :'users/index'
    end

    # Edit user
    get '/:id/edit' do
      @user = User.find(params[:id])
      erb :'users/edit'
    end

    put '/:id', allows: [:id, :login, :email] do
      @user = User.find(params['id'])
      @user.update(params)

      if @user.save
        flash[:notice] = 'User successfully updated.'
        redirect "/users/#{params['id']}"
      else
        flash[:error] = @user.errors.full_messages
        redirect "/users/#{params['id']}/edit"
      end
    end

    # Profile
    get '/:id' do
      @user = User.find_by_id(params['id'])
      if !@user.nil?
        erb :'users/show'
      else
        erb :'users/not_user'
      end
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
      
    if verify_recaptcha(model: @user) && @user.save
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

  post '/sign_in', allows: [:login, :password] do
    login = params['login']
  	password = Digest::SHA512.hexdigest(params['password'])
    @user = User.find_by(login: login, password: password)

    if @user.nil?
      flash[:notice] = 'Invalid login/password'
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