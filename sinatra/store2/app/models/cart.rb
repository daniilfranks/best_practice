class Cart
  attr_reader :books

  def initialize(books = [])
    @books = books
  end

  def self.build_from_hash(hash)
    items = if hash['cart']
              hash['cart']['items'].map do |item_data|
    	          CartItem.new(item_data['product_id'], item_data['quantity'])
              end
            else
              []
            end

    new items
  end

  def self.session_cart(session)
  	resault = if session['cart']
			    session['cart']['books'].map do |books|
                  books
			    end
			  else
			    []
			  end

    new resault
  end

  def add_book(book_id, quantity)
    book = Book.find(book_id)

    if book
      books = @books.find { |book| @books.id == book_id }
      if books
      	books.quantity += 1
      else
        @books << book
      end
    end
  end

  def serialize
  	books = @books.map do |book| 
  		      {
  		      	'book_id' => book.id,
  		        'quantity' => book.quantity
  		      }
    end

    { 'books' => books }
  end
end
