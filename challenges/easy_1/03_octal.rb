# create an object class Octal
# at instantiation, takes a string equivalent to octal integer

# has to_decimal method that converts to a decimal equivalent of class Integer
  # calculate manually
  # split into list of integer digits, smallest to left
  # multiply each digit by 8^index
  # sum the multiplied digits
# if input string does not correspond to octal number, interpreted as octal 0
  # if string contains anything other than 0-7 digits (alph, 9, etc)
  # leading 0 calculated accurately

class Octal
  def self.valid?(string)
    string =~ /\A[0-7]+\Z/
  end

  def initialize(octal_string)
    @base = 8
    @string = Octal.valid?(octal_string) ? octal_string : '0'
  end

  def to_decimal
    digits = @string.to_i.digits
    digits.map!.with_index { |digit, idx| digit * @base**idx }
    digits.sum
  end
end