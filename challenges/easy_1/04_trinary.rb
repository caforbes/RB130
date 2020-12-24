# create an object class Trinary
# at instantiation, takes a string equivalent to trinary integer

# has to_decimal method that converts to a decimal equivalent of class Integer
  # calculate manually
  # split into list of integer digits, smallest to left
  # multiply each digit by 3^index
  # sum the multiplied digits
# if input string does not correspond to trinary number, interpreted as trinary 0
  # if string contains anything other than 0-2 digits (alph, 3, etc)
  # leading 0 calculated accurately

class BaseNumber
  BASE = 10

  def self.valid?(string)
    string =~ /\A\d+\Z/
  end

  def initialize(string)
    @string = self.class.valid?(string) ? string : '0'
  end

  def to_decimal
    digits = @string.to_i.digits
    digits.map!.with_index { |digit, idx| digit * self.class::BASE**idx }
    digits.sum
  end
end

class Octal < BaseNumber
  BASE = 8

  def self.valid?(string)
    string =~ /\A[0-7]+\Z/
  end
end

class Trinary < BaseNumber
  BASE = 3

  def self.valid?(string)
    string =~ /\A[0-2]+\Z/
  end
end