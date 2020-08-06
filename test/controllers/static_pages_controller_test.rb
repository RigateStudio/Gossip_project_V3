require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get userprofile" do
    get static_pages_userprofile_url
    assert_response :success
  end

end
