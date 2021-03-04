require 'test_helper'

class BackstageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backstage_index_url
    assert_response :success
  end

end
