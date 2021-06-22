Given(/^I am logged in as that user$/) do
  @user = User.last
  login_as(@user)
end

Then(/^I should be on the index page$/) do
  expect(page).to have_current_path(root_path)
end