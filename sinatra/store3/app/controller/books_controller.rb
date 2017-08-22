class BooksController < ApplicationController
  before do
    set_cart
  end
  
  # Create book
  get '/books/new' do
    erb :'books/new'
  end

  post '/books' do
    @book = Book.new(params[:book])

    if @book.save
      flash[:notice] = 'Book successfully create!'
      redirect "/books/#{@book.id}"
    else
      flash[:error] = @book.errors.full_messages
      redirect '/books/new'
    end
  end

  # Edit book
  get '/books/:id/edit' do
  	@book = Book.find(params[:id])
    erb :'books/edit'
  end

  # Destroy book
  delete '/books/:id' do
    @book = Book.find(params[:id])
    @book.destroy
    redirect '/books'
  end

  patch '/books/:id' do
    @book = Book.find(params[:id])
    @book.update(params[:book])

    if @book
      flash[:notice] = 'Book successfully update!'
      redirect "/books/#{params[:id]}"
    else
      flash[:error] = @book.errors.full_messages
      redirect "/books/#{params[:id]}/edit"
    end
  end

   # Show all books
  get '/books' do
  	@books = Book.all
    erb :'books/index'
  end

  # Show book
  get '/books/:id' do
    @book = Book.find(params[:id])
    erb :'books/show'
  end
end
