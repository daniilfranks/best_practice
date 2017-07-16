require 'bundler'
Bundler.require

require 'logger'

require_relative '../lib/user'

DB = SQLite3::Database.open('db/base.db')
