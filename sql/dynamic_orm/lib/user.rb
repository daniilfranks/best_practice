require_relative '../config/environment.rb'
require 'active_support/inflector'
require 'my_active_record.rb'

class User < MyActiveRecord
  self.column_names.each do |name|
    attr_accessor name.to_sym
  end
end
