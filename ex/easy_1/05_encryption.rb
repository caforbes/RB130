# convert the string as follows
# for each character in the string (convert to array)
# convert to the next rot13 letter of the same case
  # get the index of the current (downcased) letter from the downcase alphabet
  # subtract 13 from the index
  # use the resulting letter, matching case of current letter
# return joined characters

def encrypt(str)
  str.chars.map { |char| rot13(char) }.join
end

def rot13(char)
  alphabet = ('a'..'z').to_a
  if alphabet.include?(char.downcase)
    new_index = alphabet.index(char.downcase) - 13
    alphabet.include?(char) ? alphabet[new_index] : alphabet[new_index].upcase
  else
    char
  end
end

names = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
]

names.each { |name| puts encrypt(name) }