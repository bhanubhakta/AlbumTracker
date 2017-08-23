module ApplicationHelper
  def year_range
    (1900..Date.today.year).to_a
  end
end

