#  ISO8601           "2021-03-09T16:00:00+00:00"
date_format = "%FT%H:%M:%S%:z" 

json.extract! meeting, :id, :title
json.url meeting_url(meeting, format: :json)
json.show_url meeting_url(meeting, format: :html)
json.start meeting.start_time.strftime(date_format)
json.end meeting.end_time.strftime(date_format)
json.all_day meeting.all_day