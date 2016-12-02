require 'date'
require_relative 'task'
require_relative 'due_task'


class TaskList

  def initialize
    @tasks = []
  end

  # Signature: -> String
  def to_s
    strAccumulator = ""
    @tasks.each { |task| strAccumulator +=  task.to_s }
    strAccumulator
  end

  def tasks?
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

  def incomplete_due_today?
    a = get_incomplete
    a2 = []
    a.each do |task|
      if task.class == DueTask && task.due_date? == Date.today
        a2 << task
      end
    end
    a2
  end

  def incomplete_ordered?
    a = get_incomplete
    a2 = []

    a.each do |task|
      if task.class == DueTask
        a2 << task
      end
    end
    a2.sort do |shoe, banana| shoe.due_date? <=> banana.due_date? end
    a2
  end

  def sort_both_kinds
    a = incomplete_ordered?
    b = get_incomplete
    b.each do |beach|
      if beach.class != DueTask
        a << beach
      end
    end
    a
  end

end

tdt = DueTask.new
tdt.set_due_date("2016-12-01")
tndt = DueTask.new
tndt.set_due_date("2018-04-16")
t = Task.new
t2 = Task.new

tlist = TaskList.new
tlist.add_task(tdt)
tlist.add_task(tndt)
tlist.add_task(t)
tlist.add_task(t2)

puts tlist.sort_both_kinds
puts tlist.tasks?
