class CartItem
  attr_reader :product_id, :quantity
  
  def initialize(product_id, quantity = 1)
    @product_id = product_id
    @quantity = quantity
  end

  def increment
    @quantity += 1
  end

  def items
    Item.find(product_id)
  end

  def total_price
    items.price * @quantity
  end
end
