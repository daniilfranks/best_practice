class ApplicationController < Sinatra::Base
  configure do
  	set :views, 'app/views'
  	set :public_dir, 'public'
  end

  get '/' do
  	erb :index
  end

  get '/hello' do
    'Hello world'
  end

  get "/hello/:name" do
    @name = params[:name]
    "Hello, #{@name}"
  end

  get "/integer/:num1/:num2" do
    num1 = params[:num1].to_i
    num2 = params[:num2].to_i

    "#{num1 * num2}"
  end
end
