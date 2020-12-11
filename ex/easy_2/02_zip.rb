# I: array 1, array 2 (same lengths)
# O: new nested array of same length

# create empty array
# increment through arrays with index
  # create a new array with element from each array at index
  # add to result array
# return result array

def zip(array_1, array_2) # => new_array
  zipped = []
  array_1.each_with_index { |item, ind| zipped << [item, array_2[ind]] }
  zipped
end

# def zip(array_1, array_2) # => new_array
#   array_1.map.with_index { |item, ind| [item, array_2[ind]] }
# end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
