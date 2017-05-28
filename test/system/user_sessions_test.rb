require "application_system_test_case"

class UserSessionsTest < ApplicationSystemTestCase
  test "visiting login" do
    visit login_url

    fill_in 'email', with: 'test@example.com'
    fill_in 'password', with: 'hogehoge'
    click_button 'Login'

    assert_current_path users_path
    assert_content 'Login successful'
  end

  test "fail login" do
    visit login_url

    fill_in 'email', with: 'test@example.com'
    fill_in 'password', with: 'hoge'
    click_button 'Login'

    assert_current_path login_path
    assert_content 'Login failed'
  end
end
