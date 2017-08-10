class PostsController < ApplicationController
  # Show posts
  # http://localhost:3000/api/v1/posts
  namespace '/api/v1' do
    before do
      content_type 'application/json'
    end

    get '/posts' do
    	post = Post.all

    	post = 'No posts!' if post.empty?
      { data: post }.to_json
    end

    # Create post
    # http://localhost:3000/api/v1/posts?title=First post&description=text text
    post '/posts' do
      post = Post.new(title: params[:title], description: params[:description])

      if post.save
        { data: post }.to_json
      else
        status 403
        { data: post.errors.full_messages }.to_json
      end
    end

    # Post destroy
    # http://localhost:3000/api/v1/posts/1/delete
    post '/posts/:id/delete' do
      post = Post.find_by(id: params[:id])

      if post
        post.destroy
        { data: post }.to_json
      else
        status 403
        { data: 'No found post' }.to_json
      end
    end
  end
end
