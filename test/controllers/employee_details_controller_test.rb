require "test_helper"

class EmployeeDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get get_tax" do
    get employee_details_get_tax_url
    assert_response :success
  end
end
