def gather(food)
  puts "Let's start gathering food."
  yield(food)
  puts "Nice selection of food we have gathered!"
end

items = ['apples', 'corn', 'cabbage', 'wheat']
gather(items) { |items| puts items.map(&:upcase).join(', ') }
