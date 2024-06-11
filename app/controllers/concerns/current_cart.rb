module CurrentCart
  # JT: This is a concern, which is a way to share code between controllers
  # private methods will not be accessible as actions in the controller

  private

  # JT: Look up cart by id in session, or create a new cart if none exists
  # where does the session object come from??
  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end
