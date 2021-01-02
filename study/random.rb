def use_block
  block_return = yield
  puts block_return
end

outer = 'hello'

use_block { outer }