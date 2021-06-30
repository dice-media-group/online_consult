Given('Heather visits the booking page') do
  visit backstage_bookings_path
end

Given('Heather navigates to the bookings page') do
  visit backstage_bookings_path
end

Given(/^Heather sees a list of available times$/) do
  expect(page).to have_content
end

Then(/^Heather sees the text "([^"]*)"$/) do |content|
  expect(page).to have_content content
end

Then(/^she sees the text "([^"]*)"$/) do |content|
  expect(page).to have_content content
end

Given(/^there is a room for bookings$/) do
  @meeting = FactoryBot.create(:meeting_room)
end

Given(/^she clicks on calendar link "([^"]*)"$/) do |data|
  scope = find("div[data-date='#{data}']")
  within scope do
    link = Time.parse(data).strftime('%H:%M')
    find('a', text: link).click
  end
end

When(/^Heather tries to access booking link for "([^"]*)"$/) do |date|
  date = Time.parse(date).to_formatted_s(:short)
  visit meeting_room_create_booking_path(@meeting, time: date)
end

Then(/^Heather should not see the text "([^"]*)"$/) do |text|
  expect(page).to have_no_content(text)
end
