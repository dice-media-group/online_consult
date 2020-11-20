class Meeting < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

private


  def consult_has_meetings
    unless order.meeting_limit > 0
      errors.add_to_base 'You have reached your limit of meetings for this consultation.'
    end
  end

  def generate_token
    self.token = Digest::SHA1.hexdigest([Time.now, rand].join)
  end

  def decrement_meeting_count
    sender.decrement! :invitation_limit
  end

end
