class Item
  attr_accessor :name, :description, :price

  def initialize(options = {})
    @name = options[:name]
    @description = options[:description]
    @price = options[:price]
  end
end