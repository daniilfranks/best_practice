class UsersController < ApplicationController
  get '/users' do
  	hide_page
    @users = User.all
    erb :'users/index'
  end
end
