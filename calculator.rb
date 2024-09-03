class Calculator
  def initialize(numbers)
    @numbers = numbers
  end
  
  def add
    return 0 if @numbers == ""
    delimiter = get_delimiter
    return get_sum(delimiter)
  end
  
  def get_sum(delimiter)
    negative_numbers = []
    nums = @numbers.split(delimiter).map do |str|
      num = str.to_i
      negative_numbers.push(num) if num < 0
      num  
    end
    raise "negative numbers not allowed: #{negative_numbers.join(",")}" if negative_numbers.size > 0
    return nums.sum
  end
  
  def get_delimiter
    delimiter = ","
    if @numbers[0,2] == "//" # custom delimiter defined after //
      delimiter = @numbers[2,1] 
      @numbers = @numbers.split("\n")[1] # get the string after the delimiter definition
    else
      @numbers.gsub!("\n", ",") #replace newline with comma if present
    end
    return delimiter
  end
end
