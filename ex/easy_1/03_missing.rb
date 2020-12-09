# input: sorted array of integers
# output: new(?) array of integers missing from input array
# if no elements missing from initial array, return empty array
# can include negative numbers
# array will be sorted, no overlaps

# create full range of ints from input minimum to input maximum
# get the difference of the two arrays
# return it

def missing(sorted_array)
  full_array = (sorted_array.min..sorted_array.max).to_a
  full_array - sorted_array
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []