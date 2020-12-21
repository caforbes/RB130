# In this exercise, your task is to create a new Enumerator object.
# We'll want to create an Enumerator that can iterate over an infinite list of factorials.

factorials = Enumerator.new do |y|
  numbers = [1]
  counter = 0
  loop do
    numbers << counter unless counter == 0
    y << numbers.reduce(:*)
    counter += 1
  end
end
# start with an array containing 1
# start with counter of 0
# add counter to array if counter is not 0
# multiply all integers in the array together
# yield the result to the enumerator

# Once you make this new Enumerator, test it out by printing out the first 7 factorial values, starting with zero factorial.
# More specifically, print the first 7 factorials by using an "External Iterator".

7.times { puts factorials.next }
puts ""

# Once you have done so, see what happens if you print 3 more factorials (the results won't be correct).

3.times { puts factorials.next }
puts ""
# Now, reset your Enumerator (use the rewind method).

factorials.rewind

3.times { puts factorials.next }
puts ""

# Finally, print 7 more factorials. (With internal iteration)

factorials.each_with_index do |val, idx|
  break if idx == 7
  puts "#{val}, index: #{idx}"
end
# doing it this way ruins the zero factorial

# You'll only need 3 Enumerator methods to complete this exercise.
# An Enumerator also implements the Enumerable module.
