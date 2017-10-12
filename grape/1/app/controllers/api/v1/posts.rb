module API
  module V1
    class Posts < Grape::API
      resource :posts do
        get rabl: 'posts/collection' do
          @posts = Post.all
        end

        post do
          @post = Post.new(params[:title], params[:descriptions])
          @post.save
        end
      end
    end
  end
end
