require 'bundler'
Bundler.require

require_relative '../lib/user'

db = SQLite3::Database.open('../db/base.db')
