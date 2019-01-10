module ApplicationHelper


  def full_datetime_with_year(dt, sharp=false)
    dt.strftime("%a %-d %B %Y, %l:%M%P#{' sharp' if sharp}")
  end
end
