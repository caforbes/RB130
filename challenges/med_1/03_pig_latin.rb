=begin
create PigLatin class
::translate method, :string -> :new_string
  take multi-word input
  translate each word to pig latin
    find initial consonants*
    create new string
      string with initial consonants deleted
      plus initial consonants
      plus 'ay'
  return joined string of pig latin

::initial_cluster
  get all letters preceding first aeiou vowel
  if onset ends in q, check for following 'u' and add if found
  if there is a cluster of 2+, check for special vocalized consonants
    initial x or y + consonants, change cluster to ''
  save the initial consonant/onset string
=end

class PigLatin
  def self.translate(string)
    words = string.split
    words.map! do |word|
      onset = initial_cluster(word)
      word.delete_prefix(onset) + onset + 'ay'
    end
    words.join(' ')
  end

  def self.initial_cluster(word)
    onset = word.match(/\A[^aeiou]*/i).to_s         # get obvious consonants

    if onset.match(/q$/i)                           # check for qu-
      next_char = word[onset.size]
      onset += next_char if next_char.downcase == 'u'
    elsif onset.size > 1 && onset.match(/^[yx]/i)   # check for special clusters
      onset = ''
    end
    onset
  end
end