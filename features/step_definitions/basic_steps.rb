Given(/^I navigate to the index page$/) do
  visit root_path
end

Then(/^I should see the text "([^"]*)"$/) do |content|
  expect(page).to have_content content
end

Given(/^I click on "([^"]*)"$/) do |button|
  click_link_or_button button
end

Then(/^show me the page$/) do
  save_and_open_page
end

Given(/^time is frozen at (.+)$/) do |time|
  freeze_time_at time
end
