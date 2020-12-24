# create class SumofMultiples
  # instances can be initialized with any number of divisor arguments
  # if none, default to 3 and 5
# class method .to and instance method .to
  # class version uses 3/5
  # instance method uses provided divisors
  # also takes limit argument
# find all multiples of specified numbers up to limit
  # starting from smallest divisor up to (not including) limit
  # take the number, see if it any divisor goes into it cleanly
  # if so, add to a list of multiples
  # return the sum

# define two different methods? which references which?
# instance method refers to class method procedure but specifies multiples

class SumOfMultiples
  def self.to(limit, divisors: [3, 5])
    multiples = (divisors.min...limit).select do |num|
      divisors.any? { |divisor| num % divisor == 0 }
    end
    multiples.sum
  end

  def initialize(*divisors)
    if divisors.empty? || divisors.any? { |n| n < 1 }
      raise ArgumentError, "Factors must be positive integers"
    end
    @divisors = divisors
  end

  def to(limit)
    self.class.to(limit, divisors: @divisors)
  end
end