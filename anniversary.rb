require 'date'
require_relative 'due_task'

class Anniversary < DueTask


  def initialize
    super
  end

  def to_s
    "This is an anniversary for #{@description}. Next anniversary date is: #{@due_date.to_s}"
  end

  # Purpose: set anniversary date - updates to next anniversary
  # Signature: Takes date string in "YYYY-MM-DD" format
  def set_due_date(date_string)
    super
    while Date.today > @due_date
      new_date = @due_date >> 12
      @due_date = new_date
    end
  end

end

# a = Anniversary.new
#
# a.set_due_date("2012-02-15")
#
# puts a.to_s
