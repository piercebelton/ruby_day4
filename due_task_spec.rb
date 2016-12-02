require 'rspec'
require_relative 'due_task'

describe "DueTask" do

  it "should make new DueTask Object" do
    expect{DueTask.new}.to_not raise_error
  end

  it "should set a date for a task" do
    dt = DueTask.new
    expect{dt.set_due_date("1992-05-02")}.to change{dt.due_date?}
  end

  it "should return a string with all attrs of task object" do
    dt = DueTask.new
    expect(dt.to_s).to be_a String
  end


end
