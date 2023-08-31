require "test_helper"

class FooterControllerTest < ActionDispatch::IntegrationTest
  test "should get _footer" do
    get footer__footer_url
    assert_response :success
  end
end
