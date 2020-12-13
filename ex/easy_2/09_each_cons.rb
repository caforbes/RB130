def each_cons(array)
  (0...array.length).each do |ind|
    next_ind = ind + 1
    break if next_ind >= array.length
    yield(array[ind], array[next_ind])
  end
  nil

  # index = 0
  # until index + 1 >= array.length
  #   yield(array[index], array[index + 1])
  #   index += 1
  # end
  # nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil