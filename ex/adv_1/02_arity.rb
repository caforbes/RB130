# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

=begin
Procs are objects of class Proc. They can be defined with parameters, but no
values need be passed to them as arguments; they will function as if a nil value
has been passed to them.
=end

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_lambda.call
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

=begin
Lambdas seem to be special objects of the class Proc that are created with a
different syntax, and have fixed arity. When a parameter is defined but no
argument is passed, they will raise an ArgumentError. Although they are some
subtype of Proc objects, they are not their own class (there is no Lambda class)
=end

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
block_method_1('seal')

=begin
Blocks are defined upon method invocation, they are not objects which can be
referenced or passed around, and so they don't seem to have a class. However,
when a method yields to a block but no block is given, the program will throw
a LocalJumpError since it was expecting to jump to a block. Like Procs, blocks
can define parameters but no value need be passed to them. They will function
as if a nil value was passed.
=end

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}

=begin
In the method implementation, an argument can be passed to a block when a method
yields to it. If the block defines a parameter, then that argument value can be
referenced using the block parameter name. If more parameters are defined, the
leftover ones will be evaluated as if their value is nil. However, if an
argument is passed but no parameter for the block is defined, the argument value
cannot be referenced. Particularly, any identifier for that argument that
existed in the method no longer exists (e.g. a variable name used in the mathod
is not accessible in the block). There is simply no way to reference the
argument passed if no block parameter was defined.
=end

=begin
Blocks and lambdas share the property of flexible arity. Different numbers of
arguments may be passed to them as they have defined for parameters: if more
arguments are passed, those values are simply inaccessible, whereas if fewer
arguments are passed, then the parameters which are not passed a value are
evaluated as having a value of nil and the code is run anyway. This contrasts
with lambdas, which have fixed arity, and must be passed the same number of
arguments as there are defined parameters, and will raise an argumenterror if
there is a mismatch.
Aside from that, Procs and lambdas share the property of being Proc class
objects which can be bound to variables, although lambdas are a special type
of proc object that can be created with special syntax: the lambda keyword, or
-> (args) { code } syntax. Regular procs are created with the proc keyword, or
as new Proc objects with a constructor.

--> a closure is a group of code, it is not an object
--> blocks and procs do not enforce arity, while lambdas do
=end