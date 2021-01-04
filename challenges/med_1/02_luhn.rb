=begin
create Luhn class
objects instantiated with Integer input

#addends (-> array of integers)
  # get digits in ones-first order
  # transform to new array where all ints with odd index are doubled
  # transform to array where values over 10 subtract 9
  # reverse array to ones-last order
#checksum (-> integer)
  sum the digits of addends
#valid? (-> boolean)
  # checksum modulo 10 is 0

::create ( integer -> new_integer )
  -- consider problem input, initial number must be above zero --
  start with new digit number of 0
    convert number to string
    append 0
    return to integer
  get checksum
  get remainder of checksum / 10
  increment new fixed number by 10 - result
  return fixed number
=end

class Luhn
  def self.create(input_num)
    new_num = input_num * 10      # (input_num.to_s + '0').to_i
    remainder = Luhn.new(new_num).checksum % 10

    if remainder == 0
      new_num
    else
     new_num + (10 - remainder)
    end

    # new_num = input_num * 10

    # return new_num if new(new_num).valid?

    # remainder = new(new_num).checksum % 10
    # new_num + (10 - remainder)
  end

  def initialize(number)
    @num = number
  end

  def addends
    @num.digits
        .map.with_index { |digit, idx| idx.odd? ? digit * 2 : digit }
        .map { |digit| digit > 10 ? digit - 9 : digit }
        .reverse
  end

  def checksum
    addends.sum
  end

  def valid?
    checksum % 10 == 0
  end
end