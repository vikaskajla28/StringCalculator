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
      num = 0 if num > 1000 # numbers greater than 1000 not allowed
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
    elsif @numbers[0] == "[" # custom delimiter defined inside brackets i.e [***]\n3***5***8
      delimiter = handle_multiple_delimiters
      @numbers = @numbers.split("\n")[1] # get string after delimiter definition
    else
      # default case
      @numbers.gsub!("\n", ",") #replace newline with comma if present
    end
    return delimiter
  end
  
  def handle_multiple_delimiters
    delimiter_string = @numbers.split("\n")[0]
    default_delimiter = delimiter_string[1..(delimiter_string.index("]") - 1)] # get the first delimiter
    delimiter_string.gsub!("[#{default_delimiter}]", "") # remove the delimiter
    while delimiter_string.size > 0
      current_delimiter = delimiter_string[1..(delimiter_string.index("]") - 1)]
      @numbers.gsub!(current_delimiter, default_delimiter) # so that numbers contain only a single delimiter
      delimiter_string.gsub!("[#{current_delimiter}]", "") # remove the current delimiter
    end
    return default_delimiter
  end
end
