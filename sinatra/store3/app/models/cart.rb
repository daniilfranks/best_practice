class Cart < ActiveRecord::Base
  has_many :book_carts, dependent: :destroy
end
