DateRange = Struct.new(:from_date, :to_date, keyword_init: true) do
  def range
    start_date..end_date
  end

  def start_date
    if from_date.is_a?(Date) || from_date.is_a?(DateTime)
      from_date.beginning_of_day
    else
      DateTime.parse(from_date).beginning_of_day
    end
  end

  def end_date
    if to_date.is_a?(Date) || to_date.is_a?(DateTime)
      to_date.end_of_day
    else
    DateTime.parse(to_date.to_s).end_of_day
    end
  end
end
