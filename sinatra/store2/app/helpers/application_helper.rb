module ApplicationHelper
  def cart
    @cart = Cart.session_cart(session)
  end
end
