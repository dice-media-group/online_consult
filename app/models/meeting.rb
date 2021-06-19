class Meeting < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  scope :coming_up, -> { where('start_time > ?', Time.now).order(start_time: :asc).first(2) }

  def self.find_all_starting_on_date(date)
    selected_date = date.to_s.to_date
    where(start_time: selected_date.beginning_of_day..selected_date.end_of_day)
      .order(start_time: :desc)
  end

  private

  def consult_has_meetings
    errors.add_to_base 'You have reached your limit of meetings for this consultation.' unless order.meeting_limit > 0
  end

  def generate_token
    self.token = Digest::SHA1.hexdigest([Time.now, rand].join)
  end

  def decrement_meeting_count
    sender.decrement! :invitation_limit
  end
end
