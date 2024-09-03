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
end
