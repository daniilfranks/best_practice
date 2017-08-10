class PostsController < ApplicationController
  # Posts all
  get '/posts' do
  	@post = Post.all
  	@posts_count = Post.count
    erb :'posts/index'
  end

  # Create post
  get '/posts/new' do
    erb :'posts/new'
  end

  post '/posts' do
    post = Post.new(title: params[:title], description: params[:description])

    if post.save
      redirect '/posts'
    else
      erb :'/posts/new'
    end
  end

  # Edit post
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :'posts/edit'
  end

  patch '/posts/:id' do
    post = Post.find(params[:id])

    if post.update(title: params[:title], description: params[:description])
      redirect '/posts'
    else
      redirect "/posts/#{params[:id]}/edit"
    end
  end

  # Show post
  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :'posts/show'
  end

  # Destroy post
  delete '/posts/:id' do
    post = Post.find(params[:id])
    post.destroy
    redirect '/posts'
  end
end