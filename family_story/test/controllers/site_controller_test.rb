require 'test_helper'

class SiteControllerTest < ActionDispatch::IntegrationTest
  test "should get loginPage" do
    get site_loginPage_url
    assert_response :success
  end

end
