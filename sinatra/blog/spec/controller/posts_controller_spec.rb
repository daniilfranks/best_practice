require_relative '../spec_helper'

describe 'class post' do
  before(:each) do
    Post.create(title: 'First post', description: 'text text', user_id: 1)
    Post.create(title: 'My post', description: 'text text', user_id: 1)
    Post.create(title: 'Second post', description: 'text text', user_id: 1)
    Post.create(title: 'Good post', description: 'text text', user_id: 2)
    Post.create(title: 'Last post', description: 'text text', user_id: 2)
  end

  context 'return status 200' do
    it '/posts page' do
      get '/posts'
      expect(last_response.status).to eq(200)
    end

    it '/posts/new page' do
      get '/posts/new'
      expect(last_response.status).to eq(200)
    end

    it '/posts/1 page' do
      #get '/posts/1'
      #expect(last_response.status).to eq(200)
    end

    it '/posts/1/edit page' do
      get '/posts/1/edit'
      expect(last_response.status).to eq(200)
    end
  end

  context 'metods class post' do
    it 'all posts' do
      expect(Post.all.count).to eq(5)
    end

    it 'show post' do
      expect(Post.find(1).title).to eq('First post')
    end

    it 'create post' do
      @post = Post.create(title: 'New post', description: 'text text', user_id: 1)
      expect(@post.title).to eq('New post')
    end

    it 'edit method' do
      @post = Post.find(1)
      @post.user_id = 2
      @post.save
      expect(Post.find(1).user_id).to eq(2)
    end

    it 'destroy post' do
      @post = Post.find(5)
      @post.destroy
      expect(Post.all.count).to eq(4)
    end
  end

  context 'create a new post' do
    it '/posts/new' do
      #visit '/posts/new'

      #fill_in(:title, with: 'Best post')
      #fill_in(:description, with: 'my best text')
      #click_button('Submit')

      #@post = Post.find_by_title('Best post')
      #expect(@post).to eq('Best post')
      #expect(page.body).to include('Post successfully created.')
      #expect(page.current_path).to eq('/posts')
    end
  end

  context 'edit post' do
    it '/posts/2/edit' do
      #visit '/posts/2/edit'

      #fill_in(:title, with: 'Update title')
      #fill_in(:description, with: 'Update description')
      #click_button('Edit post')

       #@post = Post.find(2)
       #expect(@post.title).to eq('Update title')
       #expect(@post.description).to eq('Update description')

       #expect(page.body).to include('Post successfully updated.')
       #expect(page.current_path).to eq('/posts')
    end
  end

  context 'destroy post' do
    it 'visit /posts/2' do
      #get '/posts/2'

      #expect(last_response.status).to eq(200)
    end

    it 'destroy post' do
      #visit '/posts/2'

      #click_button 'Delete'

      #expect(Post.all.count).to eq(4)
      #expect(page.body).to include('Post successfully deleted.')
      #expect(page.current_path).to eq('/posts')
    end
  end
end
