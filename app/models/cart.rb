class Cart < ApplicationRecord
  # JT: the dependent: :destroy option tells rails to delete any associated line items when the cart is deleted
  # this allows rails to reference line items through the cart object
  has_many :line_items, dependent: :destroy
end
