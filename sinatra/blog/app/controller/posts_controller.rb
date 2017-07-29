class PostsController < ApplicationController
  namespace '/posts' do
  	# Show all
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
      
      if @post.save
        flash[:notice] = 'Post successfully created.'
        redirect '/posts'
      else
      	flash[:error] = @post.errors.full_messages
      	redirect '/posts/new'
      end
    end

    # Update
    get '/:id/:edit' do
      @post = Post.find(params[:id])
      erb :'posts/edit'
    end

    put '/:id' do
      @post = Post.find(params[:id])
      @post.update(params['post'])

      if @post.save
        flash[:notice] = 'Post successfully updated.'
        redirect '/posts'
      else
      	flash[:error] = @post.errors.full_messages
      	redirect "/posts/#{params[:id]}/edit"
      end
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

      flash[:notice] = 'Post successfully deleted.'
      redirect to '/posts'
    end
  end
end
