Given(/^Heather navigates to the backstage index page$/) do
  visit backstage_index_path
end

# Then(/^she should see the text "([^"]*)"$/) do |content|
#   expect(page).to have_content content
# end

Then('she should see the text {string}') do |string|
  expect(page).to have_content string
end

Given(/^she clicks on "([^"]*)"$/) do |button|
  click_link_or_button button
end
