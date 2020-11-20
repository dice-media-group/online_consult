require 'test_helper'

class ConsultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @consult = consults(:one)
  end

  test "should get index" do
    get consults_url
    assert_response :success
  end

  test "should get new" do
    get new_consult_url
    assert_response :success
  end

  test "should create consult" do
    assert_difference('Consult.count') do
      post consults_url, params: { consult: { contact_email: @consult.contact_email, description: @consult.description, meeting_limit: @consult.meeting_limit, minutes_per_meeting: @consult.minutes_per_meeting, title: @consult.title, token: @consult.token } }
    end

    assert_redirected_to consult_url(Consult.last)
  end

  test "should show consult" do
    get consult_url(@consult)
    assert_response :success
  end

  test "should get edit" do
    get edit_consult_url(@consult)
    assert_response :success
  end

  test "should update consult" do
    patch consult_url(@consult), params: { consult: { contact_email: @consult.contact_email, description: @consult.description, meeting_limit: @consult.meeting_limit, minutes_per_meeting: @consult.minutes_per_meeting, title: @consult.title, token: @consult.token } }
    assert_redirected_to consult_url(@consult)
  end

  test "should destroy consult" do
    assert_difference('Consult.count', -1) do
      delete consult_url(@consult)
    end

    assert_redirected_to consults_url
  end
end
