class ApplicationController < Sinatra::Base
  configure do
    register Sinatra::Namespace
  end
end
