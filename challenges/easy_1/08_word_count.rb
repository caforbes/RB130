=begin
create class Phrase
  I: string argument
  Phrase#word_count
  Phrase#normalize

normalize
  I: regular phrase (string)
  O: new string with normalized case, all punctuation to spaces

  normalize case
  chars that count: alph, digit, apostrophe
  substitute all other characters for single space

word_count
  O: hash containing string keys and integer count values for each word

  normalize the string
  split on spaces to get words
  get unique words
  create empty counts hash
  iterate through unique words
    create word key, assign to count of the word in phrase
  assign the counts hash to variable
=end

class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words = normalized_words

    words.uniq.each_with_object({}) do |word, hash|
      hash[word] = words.count(word)
    end
  end

  private

  def normalized_words
    normal = ' ' + @phrase.downcase + ' '       # lowercase and padding
    normal = normal.gsub(/[^a-z0-9']/, ' ')     # strip punctuation
    normal = normal.gsub(/\W'([a-z0-9]+)'\W/, ' \1 ') # strip single quotation
    normal.split
  end
end