require 'test_helper'

class BackupControllerTest < ActionDispatch::IntegrationTest
  test "should get csv" do
    get backup_csv_url
    assert_response :success
  end

end
