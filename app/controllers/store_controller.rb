class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
    @page_title = 'Pragmatic Bookstore'
  end
end
