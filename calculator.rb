class Calculator
  def initialize(numbers)
    @numbers = numbers
  end
  
  def add
    return 0 if @numbers == ""
    @numbers.gsub!("\n", ",") #replace newline with comma if present
    return @numbers.split(",").map{|num| num.to_i}.sum
  end
end
