class CartsController < ApplicationController
  before do
    initialize_cart
  end

  patch '/carts/:id' do
  	@cart.add_item(params[:id])
  	session['cart'] = @cart.serialize
  	item = Item.find(params[:id])
    redirect to "/items/#{item.id}"
  end
end
