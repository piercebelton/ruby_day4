require 'rspec'
require_relative 'anniversary'

describe "Anniversary" do

  it "should create an Anniversary object" do
    expect{Anniversary.new}.to_not raise_error
  end

  anniversary = Anniversary.new

  it "should return a string with next anniversary date" do
    expect(anniversary.to_s).to be_a String
  end

  it "should set date for Anniversary object to be a Date class object" do
    expect{anniversary.set_due_date("1992-05-02")}.to change{anniversary.due_date}.from("undefined").to be_a Date
  end

  it "should change anniversary date to next occurence" do
    # input date in the past
    # test that function returns date in future
    anniversary.set_due_date("2015-12-02")
    expect(anniversary.due_date).to be >= Date.today
  end

end
