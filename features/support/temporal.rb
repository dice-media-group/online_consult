require 'timecop'

module Temporal

  def travel_to(time, &block)
    Timecop.travel parse_time(time  + Time.zone.to_s), &block
  end

  def freeze_time_at(time, &block)
    Timecop.freeze parse_time(time  + Time.zone.to_s), &block
  end

  def back_to_the_future
    Timecop.return
  end

  private

  def parse_time(time)
    zone = ActiveSupport::TimeZone.new('Stockholm')
    ActiveSupport::TimeZone[zone.name].parse(time)
  end
end