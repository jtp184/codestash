require 'test_helper'

class CodeLookupControllerTest < ActionDispatch::IntegrationTest
  test "should get lookup" do
    get code_lookup_lookup_url
    assert_response :success
  end

  test "should get upload" do
    get code_lookup_upload_url
    assert_response :success
  end

  test "should get decode" do
    get code_lookup_decode_url
    assert_response :success
  end

  test "should get lookup_fail" do
    get code_lookup_lookup_fail_url
    assert_response :success
  end

end
