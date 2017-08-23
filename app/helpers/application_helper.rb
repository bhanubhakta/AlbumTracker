module ApplicationHelper
  # Get year range to populate in the form.
  def year_range
    (1900..Date.today.year).to_a
  end
end

