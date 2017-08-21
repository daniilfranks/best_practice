class BookCart
  attr_accessor :book_id, :quantity

  def initialize(book_id, quantity)
    @book_id = book_id
    @quantity = quantity
  end

  def books
    Book.find(@book_id)
  end
end
