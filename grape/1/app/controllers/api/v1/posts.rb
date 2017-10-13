module API
  module V1
    class Posts < Grape::API
      # curl http://localhost:3000/api/v1/posts
      resource :posts do
        desc 'Return all posts'
        get rabl: 'posts/index' do
          @posts = Post.all
        end

        # curl http://localhost:3000/api/v1/posts/1
        desc 'Return a post'
        get '/:id', rabl: 'posts/show' do
          @post = Post.find(params[:id])
        end

        #curl http://localhost:3000/api/v1/posts -d "title=Hello&description=text"
        desc 'Create a post'
        post rabl: 'posts/show' do
          @post = Post.new(title: params[:title], description: params[:description])
          @post.save
        end

        # -X PUT http://localhost:3000/api/v1/posts/2 -d "title=Updated&description=new text"
        desc 'Update a post'
        put '/:id', rabl: 'posts/show' do
          @post = Post.find(params[:id])
          @post.update(title: params[:title], description: params[:description])
        end
        
        # -X DELETE http://localhost:3000/api/v1/posts/3
        desc 'Delete a post'
        delete '/:id', rabl: 'posts/show' do
          @post = Post.find(params[:id])
          @post.destroy 
        end
      end
    end
  end
end
