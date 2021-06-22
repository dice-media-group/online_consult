Given(/^the following users exists$/) do |table|
  table.hashes.each do |table|
    User.create!(table)
  end
end

Given(/^I fill in "([^"]*)" with "([^"]*)"$/) do |item, content|
  fill_in item, with: content
end

And(/^there is a user logged in$/) do
  @user = FactoryBot.create(:user)
  login_as @user, scope: :user
end
