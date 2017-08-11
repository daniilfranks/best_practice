class App < Sinatra::Base
  register Sinatra::Contrib
  enable :sessions
  
  before do
    @array = %w[car book phone]
  end

  def full_name
    'Danila Babanov'
  end

  get '/' do
    erb :'index'
  end

  get '/1' do
  	@name = 'Den'
  	@age = 26

  	session[:name] = 'Den'

    erb :'1'
  end

  get '/form' do
    erb :'form'
  end

  post '/form' do
  	session[:name] = nil
    redirect '/form'
  end

  get '/profile' do
    erb :'profile'
  end

  post '/profile' do
  	errors = validation(params)

    if errors.nil?
      @name = params[:name]
      @age = params[:age]
      @email = params[:email]
      @city = params[:city]

      erb :'profile'
    else
      @errors = errors
      erb :'profile'
    end
  end

  private

  def validation(params)
  	errors = []

  	errors << 'Params name blank!' if params[:name].strip.empty?
  end

  def secret
    'Secret string'
  end
end
