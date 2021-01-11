=begin
create class Translation
POLYPEPTIDES
  - dictionary translating AUG etc symbols to polypeptide strings
  - multiple symbols may correspond to same string
      AUG	Methionine
      UUU, UUC	Phenylalanine
      UUA, UUG	Leucine
      UCU, UCC, UCA, UCG	Serine
      UAU, UAC	Tyrosine
      UGU, UGC	Cysteine
      UGG	Tryptophan
      UAA, UAG, UGA	STOP
::of_codon
  - input: nucleotide string
  - output: polypeptide string or STOP
  - algorithm
    - turn input sequence into symbol
    - search polypeptides dictionary for input symbol
    - if found, return the polypeptide string
    - else, raise InvalidCodonError (nucleotide not found, or wrong num chars)
::of_rna
  - input: string of nucleotides
  - output: array of proteins
  - algorithm
      - create protein list
      - iterate through rna strand in groups of 3 characters
      - for each 3 characters, get the codon for those characters *
      - if result is STOP, then break and stop iterating
      - otherwise add codon to protein list
      - return protein list
=end

class TranslationError < StandardError; end
class InvalidCodonError < TranslationError; end

class Translation
  POLYPEPTIDES = {
      AUG: 'Methionine',
      UUU: 'Phenylalanine',
      UUC: 'Phenylalanine',
      UUA: 'Leucine',
      UUG: 'Leucine',
      UCU: 'Serine',
      UCC: 'Serine',
      UCA: 'Serine',
      UCG: 'Serine',
      UAU: 'Tyrosine',
      UAC: 'Tyrosine',
      UGU: 'Cysteine',
      UGC: 'Cysteine',
      UGG: 'Tryptophan',
      UAA: 'STOP',
      UAG: 'STOP',
      UGA: 'STOP',
  }

  def self.of_codon(mini_strand)
    POLYPEPTIDES.fetch(mini_strand.to_sym) { raise InvalidCodonError.new }
  end

  def self.of_rna(strand)
    protein_list = []
    strand.scan(/.../) do |triple|
      codon = of_codon(triple)
      break if codon == 'STOP'
      protein_list << codon
    end
    protein_list
  end
end