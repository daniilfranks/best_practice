require 'bundler'
require 'dotenv'
Dotenv.load
Bundler.require(:default)

OTR::ActiveRecord.configure_from_file!("config/database.yml")

require_all 'lib'
