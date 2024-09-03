require 'rspec'
require '../calculator.rb'

describe Calculator do 
  it "performs first test" do 
  end
  
  it "should return 0 when empty string passed" do
    calculator = Calculator.new("")
    expect(calculator.add).to eq 0
  end
end
