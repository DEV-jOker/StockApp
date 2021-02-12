require 'test_helper'

class UserStocksControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get user_stocks_destroy_url
    assert_response :success
  end

end
