class Cart < ActiveRecord::Base
  has_many :book_carts, dependent: :destroy

  def add_book(book_id)
    book = book_carts.find_by(book_id: book_id)

    if book
      book.quantity += 1
    else
      book = book_carts.build(book_id: book_id)
    end
    book
  end
end
