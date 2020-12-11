def step(start_val, end_val, step_by)
  counter = start_val
  while counter <= end_val
    yield(counter)
    counter += step_by
  end
  nil
end

p step(1, 10, 3) { |value| puts "value = #{value}" }
p step(1, 10, 4) { |value| puts "value = #{value}" }