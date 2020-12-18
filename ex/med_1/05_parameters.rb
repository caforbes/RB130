items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*some, one|
  puts some.join(', ')
  puts one
end

gather(items) do |first, *some ,last|
  puts first
  puts some.join(', ')
  puts last
end

gather(items) do |first, *rest|
  puts first
  puts rest.join(', ')
end

gather(items) do |a, b, c, d|
  puts "#{a}, #{b}, #{c}, #{d}"
end