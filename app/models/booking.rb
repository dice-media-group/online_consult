class Booking
  def next_twelve_months(date_as_string)
    date_from = Date.parse(date_as_string).beginning_of_month
    date_to    = date_from + 11.months
    date_range = date_from..date_to

    date_months = date_range.map { |d| Date.new(d.year, d.month, 1) }.uniq
    date_months.map { |d| [d.strftime('%B %Y'), d.to_s] }
  end
end
