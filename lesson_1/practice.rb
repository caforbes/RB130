def use(&block)
  block.call
end


use { puts 'hello!' }
use(&Proc.new { puts 'hello!' })
