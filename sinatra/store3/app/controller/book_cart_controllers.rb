class BookCartsController < ApplicationController
  before do
    set_cart
  end

  get '/cart' do
    erb :'/carts/cart'
  end

  post '/cart' do
  	book = Book.find(params['cart']['book_id'])
  	book_carts = @cart.book_carts.build(book: book)

  	if book_carts.save
  	  flash[:notice] = 'Successfully add to cart!'
      redirect '/cart'
    else
      flash[:error] = book_carts.errors.full_messages
      redirect '/books'
    end
  end
end
