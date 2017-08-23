class CartBook < ActiveRecord::Base
  belongs_to :cart
  belongs_to :book

  def total_price
    book.price * quantity
  end
end