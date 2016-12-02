require_relative 'task'

class DueTask < Task

  def initialize
    super
    @due_date = 0
  end

  def set_due_date(date_string)
    @due_date = Date.parse(date_string)
  end

  def due_date?
    @due_date
  end

  def to_s
    super + " Task is due: #{@due_date.to_s}."
  end

end
