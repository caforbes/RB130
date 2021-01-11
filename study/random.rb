def pass_nums(function)
  function.call(1, 2, 3, 4)
end

lambda_4 = lambda { |a,b,c,d| puts "#{a} + #{b} + #{c} + #{d}" }
lambda_1 = lambda { |a| puts "#{a} + b" }

pass_nums(lambda_4) # => 1 + 2 + 3 + 4
pass_nums(lambda_1) # ArgumentError