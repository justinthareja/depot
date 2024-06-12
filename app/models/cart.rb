class Cart < ApplicationRecord
  # JT: the dependent: :destroy option tells rails to delete any associated line items when the cart is deleted
  # this association adds several methods to the Cart model including the line_items method
  has_many :line_items, dependent: :destroy

  def add_product(product)
    current_item = line_items.find_by_product_id(product.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product.id)
    end
    current_item
  end

  def total_price
    line_items.sum { |item| item.total_price }
  end
end
