require 'rspec'
require_relative 'task_list'
require_relative 'due_task'

describe "TaskList" do

  it "should instantiate new TaskList object" do
    expect{TaskList.new}.to_not raise_error
  end

  it "should not raise error for string method" do
    tlist = TaskList.new
    expect{tlist}.to_not raise_error
  end

  it "should add tasks to task list" do
    tlist = TaskList.new
    t = Task.new
    expect{tlist.add_task(t)}.to change{tlist.tasks?}
  end

  it "should return array of complete & incomplete tasks" do
    tc = Task.new
    tc.complete
    ti = Task.new

    tlist = TaskList.new
    tlist.add_task(tc)
    tlist.add_task(ti)

    expect((tlist.get_complete).length).to be(1)
    expect((tlist.get_incomplete).length).to be(1)
  end

  it "should return arrays of incomplete tasks that are due today" do
    tdt = DueTask.new
    tdt.set_due_date("2016-12-01")
    tndt = DueTask.new
    tndt.set_due_date("2018-04-16")

    tlist = TaskList.new
    tlist.add_task(tdt)
    tlist.add_task(tndt)

    expect((tlist.incomplete_due_today?).length).to be(1)
    
  end

  it "should return an array of incomplete tasks in order of due date" do

    tdt = DueTask.new
    tdt.set_due_date("2016-12-01")
    tndt = DueTask.new
    tndt.set_due_date("2018-04-16")

    tlist = TaskList.new
    tlist.add_task(tdt)
    tlist.add_task(tndt)

    expect((tlist.incomplete_ordered?).length).to eq(2)

  end

  it "should return an array of incomplete tasks, first in order by date, and then the tasks with no dates" do

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

    expect((tlist.sort_both_kinds).length).to eq(4)

  end

end
