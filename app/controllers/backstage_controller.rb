class BackstageController < ApplicationController
  def index
    @meetings = Meeting.coming_up
    @meeting_rooms = MeetingRoom.all
  end

  def analytics; end
end
