class Anagram
  def initialize(word)
    @word = word
  end

  def match(list)
    list.select do |test_word|
      anagram?(test_word.downcase, @word.downcase)
    end
  end

  private

  def anagram?(word, other)
    word.chars.sort == other.chars.sort &&
      word != other
  end
end
