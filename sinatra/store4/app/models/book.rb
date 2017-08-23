class Book < ActiveRecord::Base
  has_many :cart_books
end