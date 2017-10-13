require 'grape-swagger'
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
      # http://localhost:3000/api/v1/swagger_doc
      add_swagger_documentation hide_documentation_path: true,
                            hide_format: true,
                            api_version: 'v1',
                            doc_version: '0.0.1',
                            info: {
                              title: 'My first app',
                              description: 'text text'
                            }
    end
  end
end
