class Cart < ActiveRecord::Base
  has_many :cart_books, dependent: :destroy

  def add_book(book_id, quantity)
    book = cart_books.find_by(book_id: book_id)

    if book
      book.quantity += quantity.to_i
    else
      book = cart_books.build(book_id: book_id, quantity: quantity)
    end
    book
  end

  def total_price
    cart_books.to_a.sum { |book| book.total_price }
  end
end
