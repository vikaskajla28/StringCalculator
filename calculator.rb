class Calculator
  def initialize(numbers)
    @numbers = numbers
  end
  
  def add
    return 0 if @numbers == ""
    return @numbers.split(",").map{|num| num.to_i}.sum
  end
end
