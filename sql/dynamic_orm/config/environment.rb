require 'bundler'
Bundler.require

require 'logger'

DB = SQLite3::Database.open('db/base.db')
DB.results_as_hash = true
