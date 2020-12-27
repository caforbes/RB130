=begin
create a on object class: Anagram
on instantiation, input a string
instance method Anagram#match:
  Input: array of strings
  Output: new filtered array of strings containing only anagrams of initial word
    # same word is not an anagram: cat -> cat is bad
    # anagrams are case insensitive: cat -> ACT is ok
  Algorithm:
    filter the input array
    reject all strings that are anagrams
    to check if anagram:
      lowercase both strings, reject if they are the same
      split each lowercased word into individual chars
      sort the array of chars
      are the arrays the same?
=end

class Anagram
  def initialize(string)
    @target = string.downcase
    @chars = @target.chars.sort
  end

  def match(array)
    array.select { |word| is_match?(word) }
  end

  def is_match?(string)
    return false if string.downcase == @target
    string.downcase.chars.sort == @chars
  end
end