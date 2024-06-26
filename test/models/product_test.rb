# frozen_string_literal: true

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # JT: fixtures are populated every time a test is run
  # the default for tests is to load all fixtures before running the test
  # adding a fixtures directive to the class will only load the fixtures you specify
  fixtures :products
  test 'product attributes must not be empty' do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
  end

  test 'product price must be positive' do
    product = Product.new(title: 'My Book Title',
                          description: 'yyy',
                          image_url: 'zzz.jpg')
    product.price = -1
    assert product.invalid?
    assert_equal ['must be greater than or equal to 0.01'],
                 product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ['must be greater than or equal to 0.01'],
                 product.errors[:price]

    product.price = 1
    assert product.valid?
  end

  def new_product(image_url)
    Product.new(title: 'My Book Title',
                description: 'yyy',
                price: 1,
                image_url:)
  end

  test 'image url' do
    ok = %w[fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
            http://a.b.c/x/y/z/fred.gif]
    bad = %w[fred.doc fred.gif/more fred.gif.more]

    ok.each do |name|
      assert new_product(name).valid?, "#{name} should be valid"
    end

    bad.each do |name|
      assert new_product(name).invalid?, "#{name} should be invalid"
    end
  end

  test 'product is not valid without a unique title' do
    # JT: products(:ruby) is how to access fixture within a test
    product = Product.new(title: products(:ruby).title, description: 'yyy', price: 1, image_url: 'fred.gif')
    assert product.invalid?
    assert_equal ['must be unique'], product.errors[:title]
  end
end
