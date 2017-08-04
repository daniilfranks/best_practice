class UsersController < ApplicationController
  # Namespace
  namespace '/users' do
  	# Show all users
    get do
      hide_page
      @users = User.paginate(:page => params[:page], :per_page => 2)
      erb :'users/index'
    end

    # Edit user
    get '/:id/edit' do
      hide_page
      @user = User.find(params[:id])
      erb :'users/edit'
    end

    put '/:id', allows: [:id, :login, :email] do
      user = User.find(params['id'])
      user.update(params)

      if user.save
        flash[:notice] = 'User successfully updated.'
        redirect "/users/#{params['id']}"
      else
        flash[:error] = @user.errors.full_messages
        redirect "/users/#{params['id']}/edit"
      end
    end

    # Show
    get '/:id' do
      hide_page
      @user = User.find_by_id(params['id'])
      if !@user.nil?
        @posts = @user.posts.paginate(:page => params[:page], :per_page => 2)
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

  post '/sign_up', allows: [:login, :email, :password, :'g-recaptcha-response'] do
    login = params['login']
  	email = params['email'].downcase
  	password = User.digest(params['password'])

    user = User.new(login: login, email: email, password: password )
      
    if verify_recaptcha(model: user) && user.save
      log_in(user)
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
  	password = User.digest(params['password'])
    user = User.find_by(login: login, password: password)

    if user.nil?
      flash[:notice] = 'Invalid login/password'
      redirect '/sign_in'
    else
      flash[:notice] = 'Successfully log in.'
      log_in(user)
      redirect '/'
    end
  end

  # Logout
  delete '/logout' do
    log_out
    redirect to '/'
  end
end