# iterate over a collection
# perform input block to perform operation on collection item
# return values of block builds new array
# return new array

# I: array + block
# O: new array (return vals of block)
# if input empty, return empty array

def map(array)
  mapped_arr = []

  for item in array
    mapped_arr << yield(item)
  end

  mapped_arr
end

# def map(array)
#   array.each_with_object([]) { |item, map| map << yield(item) }
# end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

p map([]) { |value| raise("test error") } == []
