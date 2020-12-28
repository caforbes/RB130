=begin
create a DNA class
instantiate with one string object (may be empty)
DNA#hamming_distance
  takes 1 argument: another string (DNA strand)
  outputs integer: number of chars different between two strings
  if strings of different length, only evaluates for shorter length, ignores tail

1
  pick the shorter string
    sort by length
    assign shorter to x, longer to y
  start with counter at 0
  iterate over chars in shorter string, with index
    if char at that index is different than char in longer string at that index
    increment counter
  return counter

2
  get length of shortest string
  split each string into chars
  slice chars array so cut off at shortest distance
  start counter at 0
  zip two chars arrays together
    if pairs are not the same, increment counter
  return counter
=end

class DNA
  def initialize(string)
    @strand = string
  end

  def hamming_distance(other_strand)
    shortest_length = [@strand, other_strand].map(&:length).min

    distance = 0
    shortest_length.times do |index|
      distance += 1 if @strand[index] != other_strand[index]
    end
    distance
  end

  def hamming_distance_2(other_strand)
    shortest_length = [@strand, other_strand].map(&:length).min

    strand_chars = @strand.chars[0...shortest_length]
    other_chars = other_strand.chars[0...shortest_length]

    distance = 0
    strand_chars.zip(other_chars) do |pair|
      distance += 1 if pair.first != pair.last
    end
    distance
  end
end
