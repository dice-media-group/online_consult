class BackstageController < ApplicationController
  def index
    @meetings = Meeting.coming_up
  end

  def bookings
    
  end


  def analytics
    
  end
end
