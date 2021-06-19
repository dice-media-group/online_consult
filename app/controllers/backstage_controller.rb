class BackstageController < ApplicationController
  def index
    @meetings = Meeting.coming_up
  end

  def bookings
    chosen_date = params[:start_date] || Date.today.to_s
    @day_calendar_meetings = Meeting.find_all_starting_on_date(chosen_date)
  end

  def analytics; end
end
