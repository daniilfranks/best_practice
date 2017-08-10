class PostsController < ApplicationController
  # Show posts
  get '/posts' do
  	content_type :json
  	post = Post.all

  	post = 'No posts!' if post.empty?
    { status: 200, data: post }.to_json
  end

  # Create post
  # http://localhost:3000/posts?title=First post&description=text text
  post '/posts' do
    post = Post.new(title: params[:title], description: params[:description])

    if post.save
      { status: 200, data: post }.to_json
    else
      { status: 403, data: post.errors.full_messages }.to_json
    end
  end
end
