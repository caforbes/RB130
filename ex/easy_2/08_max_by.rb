def max_by(array)
  # get the value of the block for each element in the array
  # identify the max of the block values
  # get the index of the max element
  # return the element at that index of the original array

  # return nil if array.empty?
  # results = []
  # array.each { |item| results << yield(item) }
  # max = results.max
  # max_index = results.index(max)
  # array[max_index]

  # iterate through the elements of the array
  # set the first element to be the current result
  # for each element, consider the block return value
  # if it's bigger than the return value of the current result, assign it as current result
  # finally, return the current result

  array.reduce do |max, next_item|
    yield(max) > yield(next_item) ? max : next_item
  end
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil