require 'rspec'
require '../calculator.rb'

describe Calculator do 
  it "performs first test" do 
  end
  
  it "should return 0 when empty string passed" do
    calculator = Calculator.new("")
    expect(calculator.add).to eq 0
  end
  
  it "should return the sum of comma separated numbers" do
		calculator = Calculator.new("1,2,3")
		expect(calculator.add).to eq 6
	end
	
	it "should handle the case when newline is present" do
		calculator = Calculator.new("1,2\n4")
		expect(calculator.add).to eq 7
	end
	
	it "should handle custom delimiter defined in the beginning using //" do
		calculator = Calculator.new("//;\n2;6;9")
		expect(calculator.add).to eq 17
	end
	
	it "should raise exception if negative numbers are present" do 
		calculator = Calculator.new("-1,-3,5,35,9")
		expect{calculator.add}.to raise_error("negative numbers not allowed: -1,-3")
	end
	
	it "should ignore any numbers greater than 1000" do
		calculator = Calculator.new("1,40,3444,4")
		expect(calculator.add).to eq 45
	end
	
	it "should handle unlimited length delimiter" do
		calculator = Calculator.new("[***]\n1***2***3")
		expect(calculator.add).to eq 6
	end
	
	it "should handle multiple delimiters" do
		calculator = Calculator.new("[;][*]\n1*3*5;1")
		expect(calculator.add).to eq 10
	end
end
