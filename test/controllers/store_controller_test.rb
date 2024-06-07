require 'test_helper' # rubocop:disable Style/FrozenStringLiteralComment

class StoreControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get store_index_url
    assert_response :success
    # JT: assert_select takes a look into the response body and checks if it contains the specified HTML
    # elements or attributes. It allows you to perform assertions on the HTML structure of the page.
    assert_select 'nav a', minimum: 4
    assert_select 'main ul li', 3
    assert_select 'h2', 'Programming Ruby 1.9'
    assert_select 'div', /\$[,\d]+\.\d\d/
  end
end
