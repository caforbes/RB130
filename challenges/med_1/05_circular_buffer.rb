=begin
create CircularBuffer class
initialized with maximum length of buffer
create container for buffer (array)
buffer: old stuff in front, new stuff in back, max size

create exceptions
- BufferEmptyException
- BufferFullException

::read
reads oldest element in buffer
removes that element from buffer and returns it
raise an exception if buffer already empty

::write
takes an item and adds it to buffer if buffer has open space
if input item is nil, does nothing
if buffer is full, raises an error

::write!
behaves like write except if buffer is full, then delete the oldest element
add the new element to the buffer
but if new element is nil, do nothing

::clear
empties buffer of everything
=end


class CircularBuffer
  def initialize(max_size)
    clear
    @max_size = max_size
  end

  def read
    raise BufferEmptyException.new if empty?

    @buffer.shift
  end

  def write(item)
    return nil if item.nil?
    raise BufferFullException.new if full?

    buffer << item
    self
  end

  def write!(item)
    write(item)
  rescue BufferFullException
    read
    write(item)
  end

  def clear
    @buffer = []
  end

  def empty?
    buffer.empty?
  end

  def full?
    buffer.size == @max_size
  end

  private

  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  attr_reader :buffer
end