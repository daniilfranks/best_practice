class CartsController < ApplicationController
  before do
  	cart
  end

  get '/cart' do
    erb :'carts/cart'
  end

  post '/cart' do
  	@cart.add_book(params['cart']['book_id'].to_i, params['cart']['quantity'].to_i)
    session['cart'] = @cart.serialize
    flash[:notice] = 'The book was successfully added to the cart!'
    redirect '/books'
  end

  post '/cart/clear' do
    session['cart'] = nil
    flash[:notice] = 'Cart bin cleared!'
    redirect '/cart'
  end

  delete '/cart/:id' do
    session['cart']['books'].delete_if { |key, value| key['book_id'] == params[:id].to_i }

    flash[:notice] = 'The book was successfully deleted to the cart!'
    redirect '/cart'
  end
end
