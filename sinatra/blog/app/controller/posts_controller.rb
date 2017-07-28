class PostsController < ApplicationController
  namespace '/posts' do
  	# show all
    get do
      @posts = Post.all
      erb :'posts/index'
    end

    # Create
    get '/new' do
      erb :'posts/new'
    end

    post do
      @post = Post.new
      @post.title = params['post']['title']
      @post.description = params['post']['description']
      @post.user_id = params['post']['user_id']
      @post.save

      redirect to '/posts'
    end

    # Update
    get '/:id/:edit' do
      @post = Post.find(params[:id])
      erb :'posts/edit'
    end

    put '/:id' do
      @post = Post.find(params[:id])
      @post.update(params['post'])

      redirect "/posts/#{params[:id]}"
    end

    # Show
    get '/:id' do
      @post = Post.find(params[:id])
      erb :'posts/show'
    end

    # Destroy
    delete '/:id/delete' do
      @post = Post.find(params[:id])
      @post.destroy

      redirect to '/posts'
    end
  end
end
