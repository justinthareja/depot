class Cart < ApplicationRecord
  # JT: the dependent: :destroy option tells rails to delete any associated line items when the cart is deleted
  # this allows rails to reference line items through the cart object
  has_many :line_items, dependent: :destroy

  def add_product(product)
    # JT: what is line items without the @ symbol?
    current_item = line_items.find_by(product_id: product.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product.id)
    end
    current_item
  end
end
