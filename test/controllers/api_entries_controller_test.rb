require "test_helper"

class ApiEntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_entries_index_url
    assert_response :success
  end

  test "should get show" do
    get api_entries_show_url
    assert_response :success
  end
end
