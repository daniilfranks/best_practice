class BookCart
  attr_accessor :book_id, :quantity

  def initialize(book_id, quantity)
    @book_id = book_id
    @quantity = quantity
  end

  def books
    Book.find(@book_id)
  end

  def total_price
    price = (books.price.to_f * quantity.to_i)
    sprintf("%.2f", price)
  end
end
