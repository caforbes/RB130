def sum_check(x, y, sum)
  (x + y) == sum
end

array = [1, 2, 3]

p sum_check(*array) # => true
p sum_check(array) # ArgumentError: 1 arg instead of 3
