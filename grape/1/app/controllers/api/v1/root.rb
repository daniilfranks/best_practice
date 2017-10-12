module API
  module V1
    class Root < Grape::API
      use Rack::Config do |env|
        env['api.tilt.root'] = File.join(Dir.pwd, '/app/views')
      end
      
      prefix :api
      version 'v1', using: :path
      default_format :json
      format :json
      formatter :json, Grape::Formatter::Rabl
      
      mount API::V1::Posts
    end
  end
end
