require 'test_helper'

class PostControllerTest < ActionDispatch::IntegrationTest
  test "should get new_post" do
    get post_new_post_url
    assert_response :success
  end

  test "should get view" do
    get post_view_url
    assert_response :success
  end

end
