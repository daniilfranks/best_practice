class CartBooksController < ApplicationController
  get '/cart' do
  	current_cart
    erb :'/carts/cart'
  end

  post '/cart' do
  	current_cart
    cart_books = @cart.add_book(params['cart']['book_id'], params['cart']['quantity'])
    
    if cart_books.save
      flash[:notice] = 'Successfully add to cart!'
      redirect '/cart'
    else
      flash[:error] = cart_books.errors.full_messages
      redirect '/books'
    end
  end

  patch '/cart/:id/increment' do
    current_cart
    book = @cart.cart_books.find_by(book_id: params[:id], cart_id: @cart.id)
    book.quantity += 1
    book.save
    redirect '/cart'
  end

  patch '/cart/:id/decrement' do
    current_cart
    book = @cart.cart_books.find_by(book_id: params[:id], cart_id: @cart.id)
    book.quantity -= 1
    book.save
    redirect '/cart'
  end

  delete '/cart/clear' do
    current_cart
    cart_books = CartBook.where(cart_id: @cart.id).destroy_all
    redirect '/cart'
  end

  delete '/cart/:id' do
    current_cart
    cart_books = CartBook.find_by(book_id: params[:id], cart_id: @cart.id)
    cart_books.destroy
    redirect '/cart'
  end
end
