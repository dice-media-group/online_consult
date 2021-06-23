Given(/^user visits the booking page$/) do
  visit meeting_rooms_path
end

Given('I navigate to the meetings page') do
  visit meeting_rooms_path
end

Given(/^I see a list of available times$/) do
  expect(page).to have_content
end

Then(/^I see the text "([^"]*)"$/) do |content|
  expect(page).to have_content content
end

Given(/^there is a meeting room$/) do
  @meeting = FactoryBot.create(:meeting_room)
end

Given(/^I click on calendar link "([^"]*)"$/) do |data|
  scope = find("div[data-date='#{data}']")
  within scope do
    link = Time.parse(data).strftime('%H:%M')
    find('a', text: link).click
  end
end

Given(/^meeting is booked at "([^"]*)"$/) do |date|
  slot = Time.zone.parse(date)
  slot_to_book = @meeting.schedule
                         .occurrences(1.week.from_now)
                         .detect { |occ| occ.beginning_of_hour.localtime == slot.localtime }
  @user.book! @meeting, time: slot_to_book, amount: 1
end

When(/^I try to access booking link for "([^"]*)"$/) do |date|
  date = Time.parse(date).to_formatted_s(:short)
  visit meeting_room_create_booking_path(@meeting, time: date)
end

Then(/^I should not see the text "([^"]*)"$/) do |text|
  expect(page).to have_no_content(text)
end
