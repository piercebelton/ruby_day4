

class Task

  def initialize
    @title = ""
    @description = ""
    @completed = false
  end

  def title
    @title
  end

  def description
    @description
  end

  def to_s
    "Task Title: #{@title}. Task Description: #{@description}. Task Status: #{@completed}."
  end

  def assign(title, description)
    @title = title
    @description = description
  end

  def complete
    @completed = true
  end

  def completed?
    @completed
  end

end