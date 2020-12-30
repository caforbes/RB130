=begin
Implementation:
  add #to_roman method to Integer class

#to_roman
  I:integer
  O:string

  I 1
  V 5
  X 10
  L 50
  C 100
  D 500
  M 1000

  0 =
  1 = 1     I
  2 = 11    II
  3 = 111   III
  4 = 15    IV
  5 = 5     V
  6 = 51    VI
  7 = 511   VII
  8 = 5111  VIII
  9 = 1(10) IX

  organize rnums into dict constant with arabic integer as key
  split number into an array of digits in ones-first order
  split each digit not in roman dict into array of 1/5/10 units
  for each subarray, multiply each element by 10^subarray index
  reverse whole array into ones-last order
  flatten array
  transform each element into its string value in roman dictionary
  join elements of the array
=end

class Integer
  ROMAN = {
    1 => 'I',
    5 => 'V',
    10 => 'X',
    50 => 'L',
    100 => 'C',
    500 => 'D',
    1000 => 'M',
  } # [1, 5, 10, 50, 100, 500, 1000].zip(%w(I V X L C D M)).to_h

  def to_roman
    roman_digits = digits.map { |digit| digit.to_roman_subunits }

    roman_digits.each_with_index do |digit_seq, index|
      digit_seq.map! { |digit| ROMAN[digit * (10**index)] }
    end
    roman_digits.reverse.join
  end

  protected

  def to_roman_subunits
    case self
    when 0..3 then [1] * self
    when 4 then    [1, 5]
    when 5..8 then [5] + [1] * (self-5)
    when 9 then    [1, 10]
    end
  end
end