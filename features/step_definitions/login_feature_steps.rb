Given(/^There is a user with email "([^"]*)" and password "([^"]*)" in our database$/) do |email, password|
  FactoryBot.create(:user, email: email, password: password)
end

Then(/^I am on the index page$/) do
  expect(page).to have_current_path(root_path)
end
