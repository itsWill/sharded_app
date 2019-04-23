require 'test_helper'

class AdminReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_report = admin_reports(:one)
  end

  test "should get index" do
    get admin_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_report_url
    assert_response :success
  end

  test "should create admin_report" do
    assert_difference('AdminReport.count') do
      post admin_reports_url, params: { admin_report: {  } }
    end

    assert_redirected_to admin_report_url(AdminReport.last)
  end

  test "should show admin_report" do
    get admin_report_url(@admin_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_report_url(@admin_report)
    assert_response :success
  end

  test "should update admin_report" do
    patch admin_report_url(@admin_report), params: { admin_report: {  } }
    assert_redirected_to admin_report_url(@admin_report)
  end

  test "should destroy admin_report" do
    assert_difference('AdminReport.count', -1) do
      delete admin_report_url(@admin_report)
    end

    assert_redirected_to admin_reports_url
  end
end
