require 'date'
require_relative 'task'
require_relative 'due_task'
require_relative 'anniversary'


class TaskList

  def initialize
    @tasks = []
  end

  # Signature: -> String
  def to_s
    strAccumulator = ""
    @tasks.each { |task| strAccumulator +=  task.to_s + "\n"}
    strAccumulator
  end

  def tasks
    @tasks
  end

  def add_task(taskobj)
    @tasks << taskobj
  end

  # Signature: --> Array of Task objects
  def get_complete
    a = []
    @tasks.each do |task|
      if task.completed?
        a << task
      end
    end
    a
  end

  # Signature: --> Array of Task objects
  def get_incomplete
    a = []
    @tasks.each do |task|
      if !task.completed?
        a << task
      end
    end
    a
  end

  # Signature: --> Array of Task objects
  def incomplete_due_today
    a = get_incomplete
    a2 = []
    a.each do |task|
      if task.class == DueTask && task.due_date == Date.today
        a2 << task
      end
    end
    a2
  end

  # Signature: returns sorted array
  def sort_incomplete_by_date
    a = get_incomplete
    ordered = []

    a.each do |task|
      if task.class == DueTask && task.completed? == false
        ordered << task
      end
    end
    # sort by the object's due date
    ordered.sort_by! {|obj| obj.due_date}
    # return the ordered array
    ordered
  end

  # Signature: returns sorted array
  def sort_both_kinds
    # append incomplete Task objs to ordered list of incomplete DueDate objs
    a = sort_incomplete_by_date
    b = get_incomplete

    b.each do |task|
      if task.class != DueTask
        a << task
      end
    end
    a
  end

end

t1 = Task.new
t2 = Task.new
dt1 = DueTask.new
dt1.set_due_date("2007-01-02")
dt2 = DueTask.new
dt2.set_due_date("2006-01-07")
a1 = Anniversary.new
a1.set_due_date("2005-07-30")
a2 = Anniversary.new
a2.set_due_date("2008-09-09")

tlist = TaskList.new
tlist.add_task(t1)
tlist.add_task(t2)
tlist.add_task(dt1)
tlist.add_task(dt2)
tlist.add_task(a1)
tlist.add_task(a2)



puts tlist.to_s
puts "\n \n"
puts tlist.sort_incomplete_by_date

puts " NOW SORT BOF OF EM"
puts tlist.sort_both_kinds
