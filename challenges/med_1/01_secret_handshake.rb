=begin
SecretHandshake class
#initialize with 1 argument
- integer or string
#commands
- returns array of strings

#to_bin
  if class integer, convert to base 2 integer
  if class string,
    delete all prepending zeros from the string
    if it converts to integer and back correctly, use integer, else use 0

#commands
  have handshake components in ones-first array
  get binary chars/digits in an array in ones-first order
  map 1s to values in constant COMPONENTS array, 0s are nil
    use index to map
    transform element to element from COMPONENTS at same index
  compact the array to get rid of nils
  if contains reverse, delete reverse element and reverse to ones-last order
  return array
=end

class SecretHandshake
  COMPONENTS = ['wink', 'double blink', 'close your eyes', 'jump', :reverse]

  def initialize(input)
    @binary = to_bin_int(input)
  end

  def commands
    commands = @binary.digits.map.with_index do |digit, idx|
      COMPONENTS[idx] if digit == 1
    end

    if commands.include?(:reverse)
      commands.reverse!.delete(:reverse)
    end
    commands.compact
  end

  private

  def to_bin_int(arg)
    case arg
    when Integer then arg.to_s(2).to_i
    when /^[01]+$/ then arg.to_i
    else 0
    end
  end
end