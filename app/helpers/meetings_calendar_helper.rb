module MeetingsCalendarHelper
  def add_weekly_calendar(meetings)
    render partial: 'simple_calendar/weekly_calendar_meetings', locals: { meetings: meetings }
  end

  def meeting_position(meeting)
    "top: #{(((meeting.meeting_time - meeting.meeting_time.midnight) / 3600 - 8) * 40) + 28}px;"
  end

  def meeting_height(meeting)
    "height: #{meeting.duration * 40 / 3600}px;"
  end

  def at_location(meeting)
    " at #{meeting.location_name}" if meeting.location
  end

  def highlight_meeting(meeting)
    ' highlight' if current_page?(meeting_path(meeting)) || current_page?(edit_meeting_path(meeting))
  end

  def meeting_text(meeting)
    "<span class='name'>#{meeting.client_name}</span>#{at_location(meeting)}".html_safe
  end

  def from_to(meeting)
    "#{meeting.start_time.strftime('%l:%M %p')} - #{meeting.end_time.strftime('%l:%M %p')}"
  end

  def date_of_next(day, start_date)
    date = Date.parse(day)
    delta = date >= start_date ? 0 : 7
    date + delta
  end

  def date_of_last(day)
    date_of_next(day) - 7.days
  end
end
