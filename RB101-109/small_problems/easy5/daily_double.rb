# Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

def crunch(text)
  no_duplicates_str = ""
  text.each_char do |char|
    no_duplicates_str << char unless no_duplicates_str[-1] == char
  end
  no_duplicates_str
end

# p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
# p crunch('ggggggggggggggg') == 'g'
# p crunch('a') == 'a'
# p crunch('') == ''
