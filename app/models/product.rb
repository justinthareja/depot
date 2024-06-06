class Product < ApplicationRecord # rubocop:disable Style/Documentation,Style/FrozenStringLiteralComment
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with: /\.(gif|jpg|png)\z/i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
  # JT: allow_blank: true means that the validation will only be run if the field is not blank
  # this will avoid getting multiple error messages when the title is blank
  validates :title, allow_blank: true, length: { minimum: 10 }
end
