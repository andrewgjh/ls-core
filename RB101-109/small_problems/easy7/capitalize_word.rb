# Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase.

# You may assume that words are any sequence of non-blank characters.

# def word_cap(str)
#   str.split.map(&:capitalize).join(" ")
# end

# def word_cap(str)
#   arr = str.split.map do |word|
#     first_letter = word[0].upcase
#     word_remainder = word[1, word.size - 1].downcase
#     "#{first_letter}#{word_remainder}"
#   end
#   arr.join(" ")
# end

def word_cap(str)
  arr = str.split.map do |word|
    word.each_codepoint.with_index do |code, idx|
      if code.between?(97, 122) && idx == 0
        word[idx] = (code - 32).chr
      elsif code.between?(65, 90) && idx != 0
        word[idx] = (code + 32).chr
      end
    end
  end
  arr.join(" ")
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
