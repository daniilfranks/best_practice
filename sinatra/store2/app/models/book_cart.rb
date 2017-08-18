class BookCart
  attr_reader :book_id, :quantity

  def initialize(book_id, quantity = 1)
    @book_id  = book_id
    @quantity = quantity
  end
end
