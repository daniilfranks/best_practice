class BookCartsController < ApplicationController
  before do
    set_cart
  end

  get '/cart' do
    erb :'/carts/cart'
  end

  post '/cart' do
  	book = Book.find(params['cart']['book_id'])
  	book_carts = @cart.add_book(book.id, params['cart']['quantity'])

  	if book_carts.save
  	  flash[:notice] = 'Successfully add to cart!'
      redirect '/cart'
    else
      flash[:error] = book_carts.errors.full_messages
      redirect '/books'
    end
  end

  post '/cart/clear' do
    BookCart.where(cart_id: @cart.id).destroy_all
  	flash[:notice] = 'Cart clear!'
    redirect '/cart'
  end
end
