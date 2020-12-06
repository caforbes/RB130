def times(int)
  for n in (0...int)
    yield(n)
  end
  int
end

puts times(5) { |num| puts num }