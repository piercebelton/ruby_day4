require 'date'
require_relative 'task'

class DueTask < Task

  def initialize
    super
    @due_date = "undefined"
  end

  # Purpose: print string for all attributes of DueTask object
  def to_s
    super + " Task is due: #{@due_date.to_s}."
  end

  # Purpose: due_date setter
  # Signature: takes date string in "YYYY-MM-DD" format
  # => sets @due_date attr to be a Date class object
  def set_due_date(date_string)
    @due_date = Date.parse(date_string)
  end

  # Purpose: due_date getter
  def due_date
    @due_date
  end

end
