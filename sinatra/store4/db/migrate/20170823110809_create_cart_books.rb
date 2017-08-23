class CreateCartBooks < ActiveRecord::Migration[5.1]
  def change
  	create_table :cart_books do |t|
      t.integer :book_id
      t.integer :cart_id
      t.integer :quantity, default: 1
  	end

  	add_index :cart_books, :book_id
    add_index :cart_books, :cart_id
  end
end
