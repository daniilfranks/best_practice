ENV["SINATRA_ENV"] ||= 'development'

require 'bundler'
Bundler.require(:default, ENV["SINATRA_ENV"])
require 'sinatra/base'
require 'sinatra/contrib'
require 'sinatra/namespace'
require 'sinatra/cookies'
require 'will_paginate'
require 'will_paginate/active_record'
require 'will_paginate/view_helpers/sinatra'
require "will_paginate-foundation"
require "will_paginate/collection"
require 'sinatra/partial'
require 'rack-flash'
require 'rack/csrf'
require 'digest'
require 'sprockets'
require 'recaptcha'
require 'dotenv/load'

Recaptcha.configure do |config|
  config.site_key  = '6LdX0RcTAAAAAG82p_RGgaVTcozjtDfxwXf47tT5'
  config.secret_key = '6LdX0RcTAAAAALCgCZgbHSzJ1IpIbMsmXmhM2zBN'
end

$sprockets = Sprockets::Environment.new
%w(javascripts stylesheets images fonts).each do |name|
  $sprockets.append_path "app/assets/#{name}"
end

connection_details = YAML::load(File.open('config/database.yml'))[ENV["SINATRA_ENV"]]
ActiveRecord::Base.establish_connection(connection_details)

require_all 'app'

# http://localhost:3000/posts?post[title]=Mypost&post[description]=text&post[user_id]=1