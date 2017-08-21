class Cart
  attr_accessor :books

  def initialize(books = [])
    @books = books
  end

  def add_book(book_id, quantity = 1)
  	resault = @books.find { |book| book.book_id == book_id }

  	if resault
      resault.quantity += quantity
  	else
      @books << BookCart.new(book_id, quantity)
    end
  end

  def delete_book(book_id)
    @books.delete_if { |book| book.book_id == book_id }
  end

  def clear_cart
    @books.clear
  end

  def total_price
    @books.inject(0) { |sum, book| sum + book.total_price }
  end

  def count
    @books.count
  end
end
