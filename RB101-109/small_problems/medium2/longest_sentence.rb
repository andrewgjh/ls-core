sample = File.read('sample.txt')

file = File.read('./Frankenstein.txt')
# puts file

def longest_sentence(text)
  sentences = text.split(/(?<=[?.!])/)
  longest = sentences.max do |sentence_a, sentence_b|
    sentence_a.split.size <=> sentence_b.split.size
  end
  longest
end

def longest_word(text)
  words = text.split(" ")
  words.max_by do |word| 
    word.size
  end
end

def longest_paragraph(text)
  paragraph = text.split(/^\s*$/m)
  paragraph.max_by {|sentence| sentence.split.count}
end


p longest_word(sample)
p longest_word(file)


# p longest_sentence(sample).split.size
# p longest_sentence(sample)
# p longest_sentence(file).split.size
# p longest_sentence(file)

