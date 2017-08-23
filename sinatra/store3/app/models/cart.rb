class Cart < ActiveRecord::Base
  has_many :book_carts, dependent: :destroy

  def add_book(book_id, quantity = 1)
    book = book_carts.find_by(book_id: book_id)

    if book
      book.quantity += 1
    else
      book = book_carts.build(book_id: book_id, quantity: quantity)
    end
    book
  end

  def total_price
    book_carts.to_a.sum { |book| book.total_price }
  end
end
