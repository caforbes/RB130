# input: positive integer
# output: array of divisors, any order (sort them!)
# include one and current num

# create a list of result numbers
# loop with a counter starting at 1
  # divide input num by current num
  # if remainder is zero, store divisor and result num in result list
  # break if num to add is already in the array
  # break when passing the halfway point ??
  # increment the counter
# sort the results array
# return results array
def divisors(input)
  results = []

  (1..input).each do |num|
    divisor, remainder = input.divmod(num)
    break if results.include?(divisor)
    if remainder == 0
      results << num
      results << divisor unless num == divisor
    end
  end
  results.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99)
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
p divisors(999962000357) == [1, 999979, 999983, 999962000357]