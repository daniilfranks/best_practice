class CartsController < ApplicationController
  before do
    cart
  end

  get '/cart' do
    erb :'carts/cart'
  end

  post '/cart' do
    @cart.add_book(params['cart']['book_id'], params['cart']['quantity'])
    session['cart'] = @cart.serialize
    flash[:notice] = 'The book was successfully added to the cart!'
    redirect '/books'
  end
end
