require_relative 'config/environment'

map '/sidekiq' do
 run Sidekiq::Web
end

use BooksController
run ApplicationController
