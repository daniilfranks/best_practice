module ApplicationHelper
  def cart
    @cart = Cart.cart_session(session)
  end
end
