def increment(num)
  result = num + 1
  yield(result) if block_given?
  result
end

increment(5)
increment(10) { |res| puts res }
