Given(/^I am logged in as that user$/) do
  @user = User.last
  login_as(@user)
end

When(/^I follow image link "([^"]*)"$/) do |link_class|
  click_on(class: link_class)
end

Then(/^I should be on the index page$/) do
  expect(page).to have_current_path(root_path)
end
