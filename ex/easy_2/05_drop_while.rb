# iterate through array elements
# takes a block
# return array elements EXCEPT first ones which returned true in block
# for empty array or all truthy elements, return empty array

# start at index 0
# while block is true for item at that index, and index in array size, increment counter
# once block is false, take the index
# slice the array from that index to end
# return the slice

def drop_while(array)
  idx = 0
  while idx < array.length && yield(array[idx])
    idx += 1
  end
  array.slice(idx..-1)
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []
