def random_method(&block_arg)
  puts 'do stuff'
  run_here(block_arg)
  puts 'do more stuff'
end

def run_here(some_proc)
  some_proc.call
end

random_method { puts 1 + 1 }