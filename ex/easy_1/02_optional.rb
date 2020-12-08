def compute
  if block_given?
    yield
  else
    "Does not compute."
  end
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

def compute_fe(arg)
  return "Does not compute." unless block_given?
  yield(arg)
end

p compute_fe(1) { |n| n + 1 } == 2
p compute_fe('hi') { |str| str + ' there' } == 'hi there'
p compute_fe('hi') == 'Does not compute.'