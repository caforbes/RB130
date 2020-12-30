=begin
create class PerfectNumber
::classify Integer -> four outcomes:
  number is not valid (less than 1) -- StandardError
  'deficient' -- aliquot sum < number
  'perfect' -- aliquot sum == number
  'abundant' -- aliquot sum > number
::aliquot_sum
  get all divisors of number less number
    iterate from 1 to input number
      if current number divides into input with remainder 0, then:
      add both current number and division result to array of divisors
      if division result already in the array, stop searching
    reduce divisor array to only unique values
    remove input number from divisor array
  sum the divisors
=end

class PerfectNumber
  def self.classify(input)
    case aliquot_sum(input)
    when (0...input) then 'deficient'
    when input then       'perfect'
    else                  'abundant'
    end
  end

  def self.aliquot_sum(input)
    unless input.class == Integer && input.positive?
      raise StandardError, "must be a natural number"
    end

    divisors = divisors(input)
    divisors.delete(input)
    # divisors = (1...input).select { |num| input % num == 0 }
    divisors.sum
  end

  def self.divisors(input)
    divisors = []
    (1...input).each do |current_num|
      quotient, remainder = input.divmod(current_num)

      if remainder == 0
        break if divisors.include?(quotient)
        divisors << current_num << quotient
      end
    end
    divisors.uniq.sort
  end

  def self.divisors_2(input)
    divisor_limit = (input / 2) + 1 # rough, for speed
    (1..divisor_limit).each_with_object([]) do |current_num, divisors|
      divisors << current_num if input % current_num == 0
    end
  end
end