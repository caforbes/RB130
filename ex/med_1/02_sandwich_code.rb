# in process:
  # read text from a file
  # pass the text to the block
# in blocks"
  # count paragraphs
  # count lines
  # count words

class TextAnalyzer
  def process
    yield File.read('sample_text.txt')
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").size} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").size} lines" }
analyzer.process { |text| puts "#{text.split.size} words" }

# 3 paragraphs
# 15 lines
# 126 words
