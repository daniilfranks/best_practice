module API
  class App < Grape::API
    use Rack::Config do |env|
      env['api.tilt.root'] = File.join(Dir.pwd, '/lib/views')
    end

    format :json
    formatter :json, Grape::Formatter::Rabl

    resource :posts do
      # /posts
      get rabl: 'posts/collection' do
        @posts = Post.all
      end

      # /posts
      post do
        @post = Post.new(params[:title], params[:descriptions])
        @post.save
      end
    end
  end
end
