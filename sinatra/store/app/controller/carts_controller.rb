class CartsController < ApplicationController
  before do
    initialize_cart
  end

  patch '/carts/:id' do
  	@cart.add_item(params[:id])
  	session['cart'] = @cart.serialize
  	item = Item.find(params[:id])
  	flash[:notice] = "Added #{item.title} to cart"
    redirect to "/items/#{item.id}"
  end

  get '/carts' do
    erb :'carts/show'
  end
end
