Given('Heather navigates to the meeting') do
  backstage_bookings_path
end

Then(/^she should see a calender$/) do
  expect(page).to have_css '.simple-calendar'
end

Then(/^she should( not)? see a calendar link "([^"]*)" at ([^"]*)$/) do |negate, time, _date|
  section = find('.today')
  if negate
    expect(section.has_css?('a', text: time)).to eq false
  else
    expect(section.has_css?('a', text: time)).to eq true
  end
end
