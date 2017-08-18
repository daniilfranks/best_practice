class Book < ActiveRecord::Base
  attr_accessor :quantity
  
  def initialize(quantity = 1)
    @quantity = quantity
  end
end
