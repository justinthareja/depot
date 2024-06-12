class LineItem < ApplicationRecord
  # JT: the model for the table that contains the foreign key always has the belongs_to declaration
  # these declarations add navigational capacity to the model objects
  belongs_to :product
  belongs_to :cart

  def total_price
    product.price * quantity
  end
end
