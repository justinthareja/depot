class Product < ApplicationRecord # rubocop:disable Style/Documentation,Style/FrozenStringLiteralComment
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :title, uniqueness: { message: 'must be unique' }
  validates :image_url, allow_blank: true, format: {
    with: /\.(gif|jpg|png)\z/i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
  # JT: allow_blank: true means that the validation will only be run if the field is not blank
  # this will avoid getting multiple error messages when the title is blank
  validates :title, allow_blank: true, length: { minimum: 10 }

  has_many :line_items

  # JT: an example of a hook method, called by rails at a specific point in the object's lifecycle
  # this method will be called before rails attempts to destroy a row in the database
  before_destroy :ensure_not_referenced_by_any_line_item

  def ensure_not_referenced_by_any_line_item
    return if line_items.empty?

    # JT: this is the same place the validates method puts its error messages
    errors.add(:base, 'Line Items present')
    # JT: throw :abort is a way to stop the destroy action from completing
    throw :abort
  end
end
