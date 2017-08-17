class ItemsController < ApplicationController
  before do
    initialize_cart
  end

  # Create items
  get '/items/new' do
    erb :'items/new'
  end

  post '/items' do
    @item = Item.new(params[:items])

    if @item.save
      redirect "/items/#{@item.id}"
    else
      redirect '/items/new'
    end
  end

  # Edit
  get '/items/:id/edit' do
  	@item = Item.find(params[:id])
    erb :'items/edit'
  end

  patch '/items/:id' do
  	@item = Item.find(params[:id])

    if @item.update(title:       params[:items][:title], 
    	              description: params[:items][:description],
    	              price:       params[:items][:price],
    	              count:       params[:items][:count],
    	              image:       params[:items][:image]
    	           )
      redirect "/items/#{@item.id}"
    else
      redirect '/items/new'
    end
  end

  # Delete
  delete '/items/:id' do
    @item = Item.find(params[:id])

    @item.destroy
    redirect "/items"
  end

  # Show all items
  get '/items' do
  	@items = Item.all
    erb :'items/index'
  end

  # Show page item
  get '/items/:id' do
  	@item = Item.find(params[:id])
    erb :'items/show'
  end
end
