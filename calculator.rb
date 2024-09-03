class Calculator
  def initialize(numbers)
    @numbers = numbers
  end
  
  def add
    return 0 if @numbers == ""
    delimiter = get_delimiter
    return @numbers.split(delimiter).map{|num| num.to_i}.sum
  end
  
  def get_delimiter
    delimiter = ","
    if @numbers[0,2] == "//"
      delimiter = @numbers[2,1] 
      @numbers = @numbers.split("\n")[1] # get the string after the delimiter definition
    else
      @numbers.gsub!("\n", ",") #replace newline with comma if present
    end
    return delimiter
  end
end
