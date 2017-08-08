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
  	password = User.encrypt_password(params['password'])

    user = User.new(login: login, email: email, password: password[:password_hash], password_salt: password[:password_salt])
      
    if verify_recaptcha(model: user) && user.save
      #log_in(user)
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

  post '/sign_in', allows: [:login, :password, :remember_me] do
    login = params['login']
  	password = params['password']
    remember_me = params['remember_me']
    user = User.authenticate(login, password)

    if user
      flash[:notice] = 'Successfully log in.'
      remember_me == 'on' ? write_cookies(user) : log_in(user)
      redirect '/'
    else
      flash[:notice] = 'Invalid login/password'
      redirect '/sign_in'
    end
  end

  # Logout
  delete '/logout' do
    log_out
    redirect to '/'
  end
end
# response.set_cookie('user_id', value: Base64.encode64('1'), 
#                                   expires: Time.now + 2592000)
# request.cookies['user_id']
# response.delete_cookie('user_id')
