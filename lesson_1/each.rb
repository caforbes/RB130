def each(array)
  for element in array
    yield(element)
  end

  array
end

each([1,2,3]) { |item| p item }.tap { |obj| p obj }