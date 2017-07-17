require 'bundler'
Bundler.require

require 'logger'
require 'active_record'

require_relative '../lib/user'

DB = ActiveRecord::Base.establish_connection(
      :adapter => "sqlite3",
      :database => "../db/base.db"
    )

DB = ActiveRecord::Base.connection

if ENV["ACTIVE_RECORD_ENV"] == 'test'
  ActiveRecord::Migration.verbose = false
end
