# pauline = proc.new {|a| puts a.upcase}

[1,2,3].each { puts 'hello' }
[1,2,3].each { |element, extra| puts [element, extra].inspect }

words = %w(these are words hi bye yes no)

def method_a(param)
  yield(param)
end

method_a(words) do |first, *middle, last|
  p first
  p middle
  p last
end

def method_b(&was_a_block)
  was_a_block.call
end

method_b { puts "I'm a block" }

some_proc = proc { puts "I'm a proc" }

1.times(&some_proc)

p [1,2,3].map(&:to_s)

=begin
gem is a ruby program that you can use to extend the functionality of ruby. populary gems include pry, rubocop, byebug, minitest

require 'gem'

File
  (gemfile
  gemfile.lock)
  (Rakefile)
  lib
    source_code.rb
  test
    source_code_test.rb
  README.md


  S - set up objects
  E - execute code
  A - assert results
  T - tear down remaining objects

  mini test vs rspec
  plain ruby     domain specific language
  assertation based
  assert_equal         expecation based
  assert_include       reads more like english

   to_proc → proc click to toggle source

Returns a Proc object that maps a key to its value:

h = {foo: 0, bar: 1, baz: 2}
proc = h.to_proc
proc.class # => Proc
proc.call(:foo) # => 0
proc.call(:bar) # => 1
proc.call(:nosuch) # => nil

    * class Method
     *   def to_proc
     *     lambda{|*args|
     *       self.call(*args)
     *     }
     *   end
     * end

=end

pauline = {a: 5, b:"c"}
pauline2 = pauline.to_proc
p pauline2.call(:a)

def method_b(args)
  p args
end

t = lambda {|args| method_b(args)}

t.call('h')

=begin
In our Ruby course content on blocks, we learn about "symbol to proc" and how it works. To review briefly, consider this code:

comparator = proc { |a, b| b <=> a }

and the Array#sort method, which expects a block argument to express how the Array will be sorted. If we want to use comparator to sort the Array, we have a problem: it is a proc, not a block. The following code:

array.sort(comparator)

fails with an ArgumentError. To get around this, we can use the proc to block operator & to convert comparator to a block:

array.sort(&comparator)

This now works as expected, and we sort the Array in reverse order.

When applied to an argument object for a method, a lone & causes ruby to try to convert that object to a block. If that object is a proc, the conversion happens automatically, just as shown above. If the object is not a proc, then & attempts to call the #to_proc method on the object first. Used with symbols, e.g., &:to_s, Ruby creates a proc that calls the #to_s method on a passed object, and then converts that proc to a block. This is the "symbol to proc" operation (though perhaps it should be called "symbol to block").

Note that &, when applied to an argument object is not the same as an & applied to a method parameter, as in this code:

def foo(&block)
  block.call
end

While & applied to an argument object causes the object to be converted to a block, & applied to a method parameter causes the associated object to be converted to a proc. In essence, the two uses of & are opposites.

Did you know that you can perform a similar trick with methods? You can apply the & operator to an object that contains a Method; in doing so, Ruby calls Method#to_proc.

Using this information, together with the course page linked above, fill in the missing part of the following code so we can convert an array of integers to base 8 (octal numbers). Use the comments for help in determining where to make your modifications, and make sure to review the "Approach/Algorithm" section for this exercise; it should prove useful.

def convert_to_base_8(n)
  n.to_s(8).to_i # replace these two method calls
end

# The correct type of argument must be used below
base8_proc = method(:convert_to_base_8).to_proc
base8_proc = proc {|n| convert_to_base_8(n)}
# We'll need a Proc object to make this code work. Replace `a_proc`
# with the correct object
[8, 10, 12, 14, 16, 33].map(&base8_proc)

The expected return value of map on this number array should be:

[10, 12, 14, 16, 20, 41]
=end
public
def convert_to_base_8(n)
  n.to_s(8).to_i # replace these two method calls
end

# base8_proc = method(:convert_to_base_8).to_proc
base8_proc = proc { convert_to_base_8(n)}


p [8, 10, 12, 14, 16, 33].map(&:convert_to_base_8)