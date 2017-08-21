class Cart
  attr_accessor :books

  def initialize(books = [])
    @books = books
  end

  def self.cart_session(hash)
    resault = if hash['cart']
                hash['cart']['books'].map do |book|
                  BookCart.new(book['book_id'], book['quantity'])
                end
              else
                []
              end
    new resault
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
    price = @books.inject(0) { |sum, book| sum + book.total_price.to_f }
    sprintf("%.2f", price)
  end

  def count
    @books.count
  end

  def serialize
  	books = @books.map do |book|
      {
      	'book_id' => book.book_id,
      	'quantity' => book.quantity
      }
    end

    { 'books' => books }
  end
end
