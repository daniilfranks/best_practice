require 'bundler'
Bundler.require

require 'logger'

require_relative '../lib/user'

def connect_db
  SQLite3::Database.open('db/base.db')
end
