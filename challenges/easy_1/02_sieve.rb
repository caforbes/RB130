# create a sieve object created with a limit argument
# has a primes method that produces list of prime integers from 2 to limit
# follow the sieve algorithm to get the primes
# => starting from first number (2), mark all multiples of that number as not prime
#    iterate through following numbers, marking multiples
#    all numbers not marked as multiples are prime, return a sorted list of them
# minimmum possible limit number is 2

# what if limit number provided is below 2?

# WITH HASH
# create a hash with keys of all integers from 2 to limit (min 2)
# the value should start as true
# iterate through the (sorted) keys of the hash
# for each key, check if it is true
# if it's true, get all the multiples of that number up to the limit
  # enter a loop, defining current num
  # add the num to itself, break if over the limit
  # for each multiple, mark its value in the hash as false
# filter an array of hash keys for only those whose value remained true
# return the filtered array of keys

# WITH ARRAY
# create range of numbers from 2 to limit
# create second range to represent primes
# iterate through regular range with indices
# if number is in primes array, mark its multiples in the primes array
  # take its index and add number to it to get index of first multiple
  # reassign element at that index in primes array to nil
  # repeat until index is out of bounds for the primes array
# else skip it
# return primes array sans nil values

class Sieve
  def initialize(limit)
    @min = 2
    raise ArgumentError.new("Can't sieve values less than 2!") if limit < @min
    @limit = limit
  end

  def primes
    number_is_prime = (@min..@limit).to_h { |num| [num, true] }

    number_is_prime.keys.each do |num|
      next unless number_is_prime[num]
      multiples = (num+1..@limit).select { |possible| possible % num == 0 }
      multiples.each { |multiple| number_is_prime[multiple] = false }
    end

    number_is_prime.keys.select { |num| number_is_prime[num] }

    # numbers = (@min..@limit).to_a
    # primes = numbers.clone

    # numbers.each_with_index do |num, index|
    #   next unless primes.include?(num)

    #   multiple_index = index + num
    #   while multiple_index < primes.size
    #     primes[multiple_index] = nil
    #     multiple_index += num
    #   end
    # end
    # primes.compact
  end
end
